package pages;

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementClickInterceptedException;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 *
 * @author ASUS
 */
public class CustomerLoginPage {

    private WebDriver driver;

    // Locators
//    private By emailField = By.name("email");
//    private By passwordField = By.name("password");
    private By emailField = By.xpath("//form[@action='LoginAccountServlet']//input[@name='email']");
    private By passwordField = By.id("loginPassword");
    private By loginButton = By.id("showFormButton");
    private By CusSignIn = By.id("login");

    // Constructor
    public CustomerLoginPage(WebDriver driver) {
        this.driver = driver;
    }

    // Page actions
    public void enterEmail(String email) {
        WebElement emailElement = driver.findElement(emailField);
        emailElement.sendKeys(email);
    }

    public void enterPassword(String password) {
        WebElement passwordElement = driver.findElement(passwordField);
        passwordElement.sendKeys(password);
    }

    public void clickLoginButton() {
        try {
            WebElement loginButtonElement = driver.findElement(loginButton);
            loginButtonElement.click();
        } catch (StaleElementReferenceException e) {
            // Retry finding the element or handle appropriately
            System.out.println("Element is no longer attached to the DOM.");
        } catch (TimeoutException e) {
            // Handle timeout exception if element is not clickable within timeout
            System.out.println("Timeout waiting for element to be clickable.");
        } catch (ElementClickInterceptedException e) {
            // Handle element click intercepted exception
            System.out.println("Element click intercepted: " + e.getMessage());
        }
    }

    public void clickSignInButton() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        try {
            WebElement signInButtonElement = wait.until(ExpectedConditions.elementToBeClickable(driver.findElement(CusSignIn)));
            ((JavascriptExecutor) driver).executeScript("arguments[0].click();", signInButtonElement);
            signInButtonElement.click();
        } catch (StaleElementReferenceException e) {
            // Retry finding the element or handle appropriately
            System.out.println("Element is no longer attached to the DOM.");
        } catch (TimeoutException e) {
            // Handle timeout exception if element is not clickable within timeout
            System.out.println("Timeout waiting for element to be clickable.");
        } catch (ElementClickInterceptedException e) {
            // Handle element click intercepted exception
            System.out.println("Element click intercepted: " + e.getMessage());
        }
    }

}
