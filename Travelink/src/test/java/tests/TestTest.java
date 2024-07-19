package tests;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.JavascriptExecutor;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import io.github.bonigarcia.wdm.WebDriverManager;

import java.util.HashMap;
import java.util.Map;
import org.openqa.selenium.interactions.Actions;

public class TestTest {
  private WebDriver driver;
  private Map<String, Object> vars;
  JavascriptExecutor js;

  @BeforeEach
  public void setUp() {
    // Use WebDriverManager to setup the EdgeDriver
    WebDriverManager.edgedriver().setup();

    driver = new EdgeDriver();
    js = (JavascriptExecutor) driver;
    vars = new HashMap<String, Object>();
  }

  @AfterEach
  public void tearDown() {
    driver.quit();
  }

  @Test
  public void test() {
    driver.get("http://localhost:8080/Travelink/search");
    driver.manage().window().setSize(new Dimension(1936, 1048));
    driver.findElement(By.name("location")).click();
    {
      WebElement dropdown = driver.findElement(By.name("location"));
      dropdown.findElement(By.xpath("//option[. = 'Đà Nẵng']")).click();
    }
    driver.findElement(By.cssSelector(".form__group:nth-child(2)")).click();
    driver.findElement(By.id("numberInput")).sendKeys("2");
    driver.findElement(By.id("checkInDate")).click();
    driver.findElement(By.id("checkOutDate")).click();
    driver.findElement(By.name("number_of_rooms")).click();
    driver.findElement(By.cssSelector(".form__group:nth-child(5)")).click();
    {
      WebElement element = driver.findElement(By.cssSelector(".form__group:nth-child(5)"));
      Actions builder = new Actions(driver);
      builder.doubleClick(element).perform();
    }
    driver.findElement(By.name("number_of_rooms")).sendKeys("2");
    driver.findElement(By.cssSelector(".ri-search-line:nth-child(1)")).click();
    driver.findElement(By.cssSelector("body")).click();
    driver.findElement(By.linkText("Home")).click();
  }
}

