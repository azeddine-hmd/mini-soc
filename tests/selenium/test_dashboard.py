import os
import time
import unittest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException


class TestWazuhDashboard(unittest.TestCase):
    """
    Selenium test suite for verifying Wazuh Dashboard availability and login.
    """

    @classmethod
    def setUpClass(cls):
        """Initialize Chrome WebDriver with headless mode for CI environments."""
        cls.dashboard_url = os.getenv("WAZUH_DASHBOARD_URL", "https://localhost:443")

        chrome_options = Options()
        chrome_options.add_argument("--headless=new")  # Modern headless mode
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--ignore-certificate-errors")

        cls.driver = webdriver.Chrome(options=chrome_options)
        cls.driver.set_page_load_timeout(30)

    def test_01_dashboard_https(self):
        """Ensure dashboard is accessible over HTTPS and returns content."""
        self.driver.get(self.dashboard_url)
        time.sleep(3)
        current_url = self.driver.current_url
        self.assertTrue(current_url.startswith("https"), "Dashboard is not served over HTTPS")

    def test_02_page_title(self):
        """Verify that the page title contains 'Wazuh'."""
        title = self.driver.title
        self.assertIn("Wazuh", title, f"Unexpected page title: {title}")

    def test_03_login_form_present(self):
        """Check that login form fields are visible."""
        try:
            username = self.driver.find_element(By.NAME, "username")
            password = self.driver.find_element(By.NAME, "password")
        except NoSuchElementException:
            self.fail("Login form fields not found on dashboard page.")
        self.assertTrue(username.is_displayed() and password.is_displayed(), "Login form not visible")

    def test_04_login_with_credentials(self):
        """Attempt login with test credentials (non-production)."""
        username = os.getenv("WAZUH_USERNAME", "wazuh-admin")
        password = os.getenv("WAZUH_PASSWORD", "wazuh-admin")

        self.driver.find_element(By.NAME, "username").send_keys(username)
        self.driver.find_element(By.NAME, "password").send_keys(password)
        self.driver.find_element(By.TAG_NAME, "button").click()

        time.sleep(5)
        # After login, verify dashboard main page loads
        self.assertIn("dashboard", self.driver.current_url.lower(), "Login may have failed")

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()


if __name__ == "__main__":
    unittest.main()
