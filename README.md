![image](https://github.com/user-attachments/assets/c0b093de-20a3-4321-abf3-6a84ef386c47)![image](https://github.com/user-attachments/assets/3f6df7a7-a310-4302-814b-0977b19d5eeb)# pr2.2_obd
# ПРАКТИЧНА РОБОТА № 2
# Створення запитів у MS SQL
# Короткий опис
У цій практичній роботі було навчено створювати запити до бази даних з використанням умови `WHERE`, виконувати багатотабличні запити, 
застосовувати різні види `JOIN` для об'єднання даних із кількох таблиць, а також використовувати складні умови фільтрації. Спершу було освоєно 
використання умови `WHERE` для фільтрації даних за певними критеріями, що дозволяє точно вибирати потрібні записи. Далі було реалізовано багатотабличні 
запити, що дають змогу працювати з кількома таблицями одночасно, а також було вивчено різні типи операцій об'єднання таблиць за допомогою конструкцій `INNER JOIN`, 
`LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`. Окрім цього, були застосовані складні умови фільтрації з використанням логічних операторів `AND`, `OR`, 
що дозволило забезпечити точність вибору даних. У результаті було досягнуто високого рівня гнучкості та ефективності в роботі з даними та створенні SQL-запитів.
# SETUP.SQL
Створені таблиці:
Таблиця Animal:
![image](https://github.com/user-attachments/assets/5515ec82-d6e3-46a1-9b1e-53e6a2dd9fab)
Таблиця Vaccination:
![image](https://github.com/user-attachments/assets/99b7e1f8-95fd-410b-985e-abd18199b279)
Таблиця Caretaker:
![image](https://github.com/user-attachments/assets/a3f6308c-8f41-4c1d-be9c-bc9e12fee4e6)
Таблиця Feed:
![image](https://github.com/user-attachments/assets/02a3a4c1-c663-47fd-9a4d-37388495ea94)
Таблиця WeightMeasurement:
![image](https://github.com/user-attachments/assets/f5735115-7eb5-4913-ba4c-1dd51404c0c2)
Таблиця Family:
![image](https://github.com/user-attachments/assets/320a820c-839a-490b-9b5a-136ec3270733)
# INSERT.SQL
Дані з  таблиці Animal (50 записів):
![image](https://github.com/user-attachments/assets/990b650f-0286-4eba-a432-642183abded0)
Дані з  таблиці Vaccination (100 записів):
![image](https://github.com/user-attachments/assets/88d20c75-0029-4854-9e00-a59e7cd7f9cd)
Дані з  таблиці Caretaker (50 записів):
![image](https://github.com/user-attachments/assets/1993c7f5-c46c-445e-9de3-83d963959678)
Дані з  таблиці Feed (100 записів):
![image](https://github.com/user-attachments/assets/038bf67f-d957-4799-a235-07578c867e7d)
Дані з  таблиці WeightMeasurement (100 записів):
![image](https://github.com/user-attachments/assets/ee0be4f7-33fd-4072-9678-16a10a1cadfa)
Дані з  таблиці Family (27 записів):
![image](https://github.com/user-attachments/assets/5dbe5b61-a136-493f-8d7e-ca90615caf9e)
# QUERY.SQL
# 1)WHERE
Тварини, які є самками та мають більше трьох поросят:
![image](https://github.com/user-attachments/assets/319e5c30-b143-4a11-a410-86b7e4e01373)
Вакцинації свиней, які отримали вакцину проти свинячого грипу (список продовжується):
![image](https://github.com/user-attachments/assets/749dea96-bd4c-44b3-b320-c8f2589b4310)
Рисунок 18 – Тварини, народжених від батька "Max":
![image](https://github.com/user-attachments/assets/adbe16e8-b175-4726-9c3b-66bc0a37a95d)
Корм, який був виданий тваринам у січні (список продовжується):
![image](https://github.com/user-attachments/assets/92ed4fea-fb60-49b3-b0e1-84eef6fa5cfa)
Доглядачі, закріплені за тваринами з ID більше 10 (список продовжується):
![image](https://github.com/user-attachments/assets/6437db6d-6ac0-44b3-bd45-4d78ca3457db)
# 2)Логічні оператори AND, OR, NOT з WHERE
Тварини, які мають чоловічу стать і народилися після 1 лютого 2025 року:
![image](https://github.com/user-attachments/assets/4c22ab7f-ad2b-46c9-b02a-d237fc416b22)
Тварини, які жіночої статі або використовуються для розведення (список продовжується):
![image](https://github.com/user-attachments/assets/92633725-c102-4e5d-8e22-0864eba7e28e)
Тварини, яких годують кормом у січні з кількістю більше 30 кг:
![image](https://github.com/user-attachments/assets/7eb61b33-da76-4011-92a9-bcd8931d540b)
Вакцинації, які не є для захисту від свинячого грипу (список продовжується):
![image](https://github.com/user-attachments/assets/82f94447-facb-4dcf-a53b-b7033fc1fde3)
Тварини, які чоловічої статі або використовуються для продажу (список продовжується):
![image](https://github.com/user-attachments/assets/dd9f40f5-6651-4927-8f51-387dfb578209)
# 3) LIKE
Тварини, чиї клички починаються на літеру "M":
![image](https://github.com/user-attachments/assets/891884a6-3bbc-4e72-bfdd-251d65f8c536)
Доглядачі, чиє ім'я містить слово "John":
![image](https://github.com/user-attachments/assets/54ca7116-2dcf-4fc7-9c7a-bdccde1ff30e)
Тварини, чия кличка закінчується на "a":
![image](https://github.com/user-attachments/assets/de6a53c0-ee24-4054-94e5-600d0f704437)
Тварини, яких годували кормом назва якого починається на "C" і містить три символи (список продовжується):
![image](https://github.com/user-attachments/assets/de3959a6-ba57-4c0b-bd0b-fa6271b63509)
Тварини, чиї батьки мають кличку, що починається на "B":
![image](https://github.com/user-attachments/assets/821b468b-36bd-449f-a6eb-155cfb4f0b0a)
# 4) JOIN
Отримання інформації про свиней, їхні вакцини та дати вакцинації (список продовжується):
![image](https://github.com/user-attachments/assets/3bf4c1e0-89e8-49c5-9599-77493bfe6fbe)
Отримання інформації про тварин і їхніх доглядачів (список продовжується):
![image](https://github.com/user-attachments/assets/d2cd1ae3-b7e9-48eb-9cf6-11610a0a7611)
Отримання інформації про свиней і їхній корм за місяць (список продовжується):
![image](https://github.com/user-attachments/assets/50911109-9375-4361-b62c-33c2fe7d23c5)
Отримання інформації про вимірювання ваги свиней (список продовжується):
![image](https://github.com/user-attachments/assets/6d6f6dc4-0fdc-4a83-8e44-2b741fd6d9cb)
Отримання інформації про свиней і їхніх батьків (список продовжується):
![image](https://github.com/user-attachments/assets/e194f2df-c5a2-47e0-9c75-a9f5014a08bc)
# 5) LEFT JOIN, RIGHT JOIN, FULL JOIN
Вивести всі свині та їхні вакцинації, якщо вони є (список продовжується):
![image](https://github.com/user-attachments/assets/b96d3828-f1e6-493a-9600-a6419df30232)
Вивести всіх доглядачів та свиней, за якими вони доглядають, якщо є (список продовжується):
![image](https://github.com/user-attachments/assets/ba40af1e-dc20-48af-9144-c47dd5d42fb9)
Вивести всі свині, їхні ваги та дати вимірювань, навіть якщо для деяких свиней немає записів про вагу (список продовжується):
![image](https://github.com/user-attachments/assets/8c0d6fa6-f064-46d8-b92d-b37756494279)
Вивести всіх доглядачів і корм, які їм призначено, навіть якщо деякі корми не мають призначеного доглядача (список продовжується):
![image](https://github.com/user-attachments/assets/8782dff3-da90-4ba0-8191-3a913c6e788b)
Вивести дані про свиней і типи кормів для них, включаючи записи, де для свині немає корму (список продовжується):
![image](https://github.com/user-attachments/assets/8b067eba-a893-4a97-91ec-d248bad65920)
# 6) SUBQUERY
Запит для отримання всіх тварин, які мали вакцинацію проти "Porcine Parvovirus Vaccine" після 1-го травня 2024 року (список продовжується):
![image](https://github.com/user-attachments/assets/cac80d0a-a01a-41e3-a92c-defdaf4f5dfc)
Запит для отримання всіх свиней, яких годували кормом з назвою "Corn" у січні (список продовжується):
![image](https://github.com/user-attachments/assets/24081c9b-daf5-4c70-9434-f65d0809cc7e)
Запит для отримання свиней, яких вакцинували проти "Erysipelas Vaccine", але вони не були вакциновані проти "Swine Influenza Vaccine" (список продовжується):
![image](https://github.com/user-attachments/assets/aff99134-c061-4eb9-a83f-67f211afd1cd)
Запит для отримання всіх свиней, які мають кількість поросят більше, ніж середнє значення по всіх свинях (список продовжується):
![image](https://github.com/user-attachments/assets/d50c761e-13d3-43ab-aab7-da05537cdcdb)
Запит для отримання всіх тварин, які мають вакцину "Swine Influenza Vaccine" (список продовжується):
![image](https://github.com/user-attachments/assets/24361d1f-e994-4dd6-be42-ab1fc0a82f63)
# 7) Оператор GROUP BY та умова HAVING у поєднанні з JOIN
Загальна кількість корму для кожної свині по місяцях, де кількість корму більше ніж 25 (список продовжується):
![image](https://github.com/user-attachments/assets/9330f233-aeb3-4bd9-be68-e7c657bf2834)
Середня вага свиней для кожного батька, де середня вага більше ніж 50 кг:
![image](https://github.com/user-attachments/assets/504eda75-e265-4be8-ad97-8106d3d6309d)
Кількість свиней з певним батьком, у яких вага більше 110 кг:
![image](https://github.com/user-attachments/assets/3cf925b8-a280-4311-81eb-998a7e09545d)
Кількість свиней за кожним кормом, де середнє споживання корму більше 26 кг:
![image](https://github.com/user-attachments/assets/ce2ca0a4-2719-4fc7-8708-91b4e145fac7)
Середня вагу тварин, які проходили вакцинацію "Swine Influenza Vaccine":
![image](https://github.com/user-attachments/assets/cce720d1-5ee0-43f2-a27c-a4713266370e)
# 8) Комбінування JOIN, вкладених запитів, групування даних та складних умов фільтрації
Запит для отримання інформації про свиней та їх вакцини (список продовжується):
![image](https://github.com/user-attachments/assets/369ea473-7788-4126-95b6-857be95a1c28)
Запит для отримання доглядачів, які відповідають за свиней старше 4 років, із зазначенням кількості таких свиней (список продовжується):
![image](https://github.com/user-attachments/assets/e6eb8a41-f4db-4020-a80d-59b14f2cca92)
Запит для знаходження середньої ваги свиней з розведення, зважених за останні 2 місяці (список продовжується):
![image](https://github.com/user-attachments/assets/9e0edfe1-0a38-4b8b-9095-5d1a22c7651b)
Запит для отримання свиней та їх батьків, які народилися протягом останнього року (список продовжується):
![image](https://github.com/user-attachments/assets/e1a259ae-3869-4503-8ef3-9d238c4db821)
 Запит для отримання доглядачів, які відповідають за свиней, якщо батько свині відомий (список продовжується):
![image](https://github.com/user-attachments/assets/67a591ed-9afc-4dd4-bd7c-c68938d3312c)
# 9) Комбінація WHERE та JOIN
Отримання всіх свиней, за якими закріплено доглядача, та інформація про їхній вік і стать:
![image](https://github.com/user-attachments/assets/8cb4484b-a541-4e8d-8800-c52c210d0dc9)
Отримання свиней, які отримали вакцину "Porcine Parvovirus Vaccine" (список продовжується):
![image](https://github.com/user-attachments/assets/5cec423b-5832-4e7f-a83b-088e859502a5)
Отримання інформації про корм, який дається свиням у січні (список продовжується):
![image](https://github.com/user-attachments/assets/90719a7d-7045-44a0-b8f5-0ac1cdedac19)
Отримання всіх свиней з інформацією про їхній вік та батьків, якщо вони мають батька (список продовжується):
![image](https://github.com/user-attachments/assets/b23626c4-4ef2-4ce0-b2cd-63faaa795cc0)
Отримання свиней та їхніх доглядачів, де свині призначені для розведення (список продовжується):
![image](https://github.com/user-attachments/assets/564460e9-c0aa-4bae-a653-c0a9ccf76a7c)




