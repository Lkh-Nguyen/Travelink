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
