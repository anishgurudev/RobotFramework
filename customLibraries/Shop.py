# from robot.libraries.BuiltIn import BuiltIn
# from SeleniumLibrary.locators.customlocator import element
# from selenium.webdriver.chrome.webdriver import WebDriver
# from robot.api.deco import library
# from robot.api.deco import keyword
# @library
class Shop:
    # def __init__(self):
    #     # self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
    #     self.selLib: element  = BuiltIn().get_library_instance("SeliniumLibrary")

    # method name will be converted to keyword name      Hello Test
    # @keyword
    def hello_test(self):
        print("hello automater")

    # @keyword
    # def add_item_to_cart_and_checkout(self, productList):
    #     #    ${cardElements} =    Get WebElements    ${ShopPage_CardTiles}
    #     self.selLib.get_webelements()
