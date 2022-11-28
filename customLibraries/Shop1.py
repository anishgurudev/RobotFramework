from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.webdriver import WebDriver
from robot.api.deco import keyword
from robot.api.deco import library


@library
class Shop:
    def __init__(self):
        # self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
        self.driver: WebDriver = (
            BuiltIn().get_library_instance("SeliniumLibrary").driver
        )

    # method name will be converted to keyword name      Hello Test
    def hello_test(self):
        print("hello automater")

    @keyword
    def add_item_to_cart_and_checkout(self, productList):
        #    ${cardElements} =    Get WebElements    ${ShopPage_CardTiles}
        # self.driver.get_webelements()
        self.driver.find_elements()
