import sqlite3
import re
from datetime import datetime, timedelta

# Constants
SHERRI_ID = "4167" # ID of Sherri
DATETIME_FORMAT="%Y-%m-%d %H:%M:%S"

# Setup
con = sqlite3.connect("hod.db")
cur = con.cursor()

# Get all data
customers = cur.execute("select * from customers").fetchall()
orders = cur.execute("select * from orders").fetchall()
orders_items = cur.execute("select * from orders_items").fetchall()
products = cur.execute("select * from products").fetchall()

# Extract relevant items (that have color)
SKU_items_with_color = []
for item in products:
    if not re.search(r".*\(.*\).*", str(item[1])):
        continue
    SKU_items_with_color.append(item[0])
    
# All items Sherri ordered with color in description
sherri_orders_dates = []
for order in orders:
    if not (SHERRI_ID == order[1]): # Sherri customer ID
        continue

    for ordered_item in orders_items:
        if not (order[0] == str(ordered_item[0])): # Check only Sherries order
            continue
        if not ordered_item[1] in SKU_items_with_color: # Order including relevant item
            continue
        sherri_orders_dates.append(datetime.strptime(str(order[2]), DATETIME_FORMAT)) # Append all orders containing purchase of a relevant item
        
# Get names of all people who ordered a coloured item same time
relevant_customers = []
for order in orders:
    if (SHERRI_ID == order[1]): # Sherri customer ID
        continue
    order_date = datetime.strptime(order[2], DATETIME_FORMAT)
    for date in sherri_orders_dates:
        delta = date - order_date
        if not abs(delta.total_seconds()) <= 15*60: # Orders within 15 minuters of each other
            continue
        
        for ordered_item in orders_items:  
            if str(ordered_item[0]) == order[0]:
                if ordered_item[1] in SKU_items_with_color: # Order including relevant item
                    relevant_customers.append(order[1])
                break

for customer in customers:
    if str(customer[0]) in relevant_customers:
        print(customer[1], customer[5])