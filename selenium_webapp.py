from seleniumbase import Driver

# تهيئة المتصفح
driver = Driver(browser="chrome", headless=True)
driver.get("https://www.google.com")

# البحث عن جميع الروابط في الصفحة
links = driver.find_elements("tag name", "a")

# عرض نص كل رابط وعنوانه
for link in links:
    print(f"النص: {link.text} | الرابط: {link.get_attribute('href')}")

# إنهاء الجلسة وإغلاق المتصفح
driver.quit()
