-- In this project, I analyzed sales data and customer feedback for Rare Beauty to uncover trends and opportunities for growth. 
-- The aim was to generate actionable insights that could inform marketing strategies and product development.
-- The project wrapped up with a thorough report that laid out the analysis, key findings, and strategic recommendations, all backed by clear visuals that made the insights easy to understand.


CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Date DATE,
    Product_ID INT,
    Quantity_Sold INT,
    Price DECIMAL(10, 2),
    Total_Sales DECIMAL(10, 2)
);

CREATE TABLE Customer_Feedback (
    Feedback_ID INT PRIMARY KEY,
    Product_ID INT,
    Review_Text TEXT,
    Rating INT,
    Date DATE
);

INSERT INTO Sales (Sale_ID, Date, Product_ID, Quantity_Sold, Price, Total_Sales) VALUES
(1, '2023-01-01', 101, 10, 20.00, 200.00),
(2, '2023-01-02', 102, 5, 30.00, 150.00),
(3, '2023-01-03', 101, 8, 20.00, 160.00),
(4, '2023-01-04', 103, 15, 25.00, 375.00);

INSERT INTO Customer_Feedback (Feedback_ID, Product_ID, Review_Text, Rating, Date) VALUES
(1, 101, 'Great product!', 5, '2023-01-05'),
(2, 102, 'Not bad, but could be better.', 3, '2023-01-06'),
(3, 101, 'Love it!', 5, '2023-01-07'),
(4, 103, 'Disappointed, didn’t meet expectations.', 2, '2023-01-08');

**How can we analyze the sales trends by product to find out which products have the highest total sales amount and total quantity sold?

SELECT Product_ID, SUM(Quantity_Sold) AS Total_Quantity_Sold, SUM(Total_Sales) AS Total_Sales_Amount
FROM Sales
GROUP BY Product_ID
ORDER BY Total_Sales_Amount DESC;



**What SQL query can we use to calculate the average customer rating and total number of reviews for each product based on customer feedback?
  
SELECT Product_ID, AVG(Rating) AS Average_Rating, COUNT(Feedback_ID) AS Total_Reviews
FROM Customer_Feedback
GROUP BY Product_ID;
