package pages;

import java.time.Duration;
import org.openqa.selenium.By;
import org.openqa.selenium.ElementClickInterceptedException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 *
 * @author DUYAN
 */
public class LoginPage {

    private WebDriver driver;

    // Locators
    private By emailField = By.name("email");
    private By passwordField = By.name("password");
    private By emailField1 = By.cssSelector("form[action='LoginAccountServlet'] input[name='email']");
    private By passwordField1 = By.cssSelector("#loginPassword");
    private By loginButton = By.cssSelector("input[value='Login']");

    private By CusLogin = By.id("showFormButton");
    private By CusSignIn = By.cssSelector("#login");

    // Constructor
    public LoginPage(WebDriver driver) {
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
    
    public void enterEmail1(String email) {
        WebElement emailElement = driver.findElement(emailField1);
        emailElement.sendKeys(email);
    }

    public void enterPassword1(String password) {
        WebElement passwordElement = driver.findElement(passwordField1);
        passwordElement.sendKeys(password);
    }

    public void clickLoginButton() {
        WebElement loginButtonElement = driver.findElement(loginButton);
        loginButtonElement.click();
    }

    public void clickCusLogin() {
        WebElement cusLoginElement = driver.findElement(CusLogin);
        cusLoginElement.click();
    }

    public void clickSignInButton() {
        WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
        try {
            WebElement signInButtonElement = wait.until(ExpectedConditions.elementToBeClickable(driver.findElement(CusSignIn)));
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
