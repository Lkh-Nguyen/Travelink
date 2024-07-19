package tests;
import org.junit.Before;
import org.junit.After;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import java.util.*;
import java.net.MalformedURLException;
import java.net.URL;
import org.junit.jupiter.api.Test;
public class TestTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;
  @Before
  public void setUp() {
    driver = new ChromeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }
  @After
  public void tearDown() {
    driver.quit();
  }
  @Test
  public void test() {
    driver.get("http://localhost:8080/Travelink/homeCustomerServlet");
    driver.manage().window().setSize(new Dimension(1936, 1048));
    driver.findElement(By.name("location")).click();
    {
      WebElement dropdown = driver.findElement(By.name("location"));
      dropdown.findElement(By.xpath("//option[. = 'Đà Nẵng']")).click();
    }
    driver.findElement(By.id("numberInput")).click();
    driver.findElement(By.id("numberInput")).sendKeys("2");
    driver.findElement(By.name("check_in_date")).click();
    driver.findElement(By.name("check_in_date")).sendKeys("2024-07-19");
    driver.findElement(By.name("check_out_date")).click();
    driver.findElement(By.name("check_out_date")).sendKeys("2024-07-20");
    driver.findElement(By.name("number_of_rooms")).click();
    driver.findElement(By.name("number_of_rooms")).sendKeys("2");
    driver.findElement(By.cssSelector(".btn-secondary")).click();
    driver.findElement(By.cssSelector(".ri-search-line:nth-child(1)")).click();
  }
}
