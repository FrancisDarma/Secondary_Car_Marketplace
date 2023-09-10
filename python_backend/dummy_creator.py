from faker import Faker
import pandas as pd
import numpy as np
from sql_connector import connect_data
import pandas.io.sql as psql
from sqlalchemy import create_engine, text
import random

fake = Faker('id_ID')

class DummyCreator:
    
    def __init__(self, sql_source):
        self.sql_source = sql_source
    
    def dummy_seller(self):
        
        n_data = int(input('''
                           Masukkan jumlah baris dummy yang anda ingin ciptakan:
                           ----------------------------------------------------\n
                           '''))
           
        #read city source   
        sql_query = text("SELECT * FROM CITY")
        
        df_city = psql.read_sql(sql_query, con=self.sql_source)
        
        city_ids = [random.choice(df_city['city_id']) for i in range(n_data)]
        city_ids = list(map(int, city_ids))
        
        column_name=['seller_name','seller_contact','seller_email','city_id']
        table = {}

        table['seller_name']=[fake.name() for i in range(n_data)]
        table['seller_contact']=[fake.phone_number() for i in range(n_data)]
        table['seller_email']=[fake.email() for i in range(n_data)]
        table['city_id'] = city_ids
        
        seller_df=pd.DataFrame(data=table,columns=column_name)
        
        # Mendefinisikan list kosong untuk menyimpan data seller dalam bentuk dictionary
        list_of_sellers = []
        
        # Melakukan perulangan untuk mengisi list_of_sellers
        for i in range(len(table['seller_name'])):
            seller = {
                'seller_name': table['seller_name'][i],
                'seller_contact': table['seller_contact'][i],
                'seller_email': table['seller_email'][i],
                'city_id': table['city_id'][i]
            }
            
            list_of_sellers.append(seller)
        
        #input query
        injection_query = text("""
                    INSERT INTO SELLER(seller_name,seller_contact,seller_email,city_id)
                    VALUES(:seller_name,:seller_contact,:seller_email,:city_id)
                    """)
        
        #eksekusi inject per baris data
        for rows in list_of_sellers:
            
            self.sql_source.execute(injection_query, rows)
        
        #injeksi data
        self.sql_source.commit()
        
        print(seller_df)
        
        return list_of_sellers

    def dummy_buyer(self):
        
        n_data = int(input('''
                           Masukkan jumlah baris dummy yang anda ingin ciptakan:
                           ----------------------------------------------------\n
                           '''))
           
        #read city source   
        sql_query = text("SELECT * FROM CITY")
        
        df_city = psql.read_sql(sql_query, con=self.sql_source)
        
        city_ids = [random.choice(df_city['city_id']) for i in range(n_data)]
        city_ids = list(map(int, city_ids))
        
        column_name=['buyer_name','buyer_contact','buyer_email','city_id']
        table = {}

        table['buyer_name']=[fake.name() for i in range(n_data)]
        table['buyer_contact']=[fake.phone_number() for i in range(n_data)]
        table['buyer_email']=[fake.email() for i in range(n_data)]
        table['city_id'] = city_ids
        
        buyer_df=pd.DataFrame(data=table,columns=column_name)
        
        # Mendefinisikan list kosong untuk menyimpan data buyer dalam bentuk dictionary
        list_of_buyers = []
        
        # Melakukan perulangan untuk mengisi list_of_buyer
        for i in range(len(table['buyer_name'])):
            buyer = {
                'buyer_name': table['buyer_name'][i],
                'buyer_contact': table['buyer_contact'][i],
                'buyer_email': table['buyer_email'][i],
                'city_id': table['city_id'][i]
            }
            
            list_of_buyers.append(buyer)
        
        #input query
        injection_query = text("""
                    INSERT INTO BUYER(buyer_name,buyer_contact,buyer_email,city_id)
                    VALUES(:buyer_name,:buyer_contact,:buyer_email,:city_id)
                    """)
        
        #eksekusi inject per baris data
        for rows in list_of_buyers:
            
            self.sql_source.execute(injection_query, rows)
        
        #injeksi data
        self.sql_source.commit()
        
        print(buyer_df)
        
        return list_of_buyers
    
    def dummy_adv(self):
        
        n_data = int(input('''
                           Masukkan jumlah baris dummy yang anda ingin ciptakan:
                           ----------------------------------------------------\n
                           '''))
           
        #read city source   
        sql_query_city = text("SELECT * FROM CITY")
        df_city = psql.read_sql(sql_query_city, con=self.sql_source)
        
        #read car source   
        sql_query_car = text("SELECT * FROM CAR")
        df_car = psql.read_sql(sql_query_car, con=self.sql_source)
        
        #read seller source   
        sql_query_seller = text("SELECT * FROM SELLER")
        df_seller = psql.read_sql(sql_query_seller, con=self.sql_source)
        
        city_ids = [random.choice(df_city['city_id']) for i in range(n_data)]
        city_ids = list(map(int, city_ids))
        
        car_ids = [random.choice(df_car['product_id']) for i in range(n_data)]
        car_ids = list(map(int, car_ids))
        
        seller_ids = [random.choice(df_seller['seller_id']) for i in range(n_data)]
        seller_ids = list(map(int, seller_ids))
         
        column_name=['adv_title','seller_id','product_id','city_id','allow_bid']
        
        table = {}

        table['adv_title']=[fake.text() for i in range(n_data)]
        table['seller_id']=seller_ids
        table['product_id']=car_ids
        table['city_id'] = city_ids
        table['allow_bid'] = [random.choice([True, False]) for i in range(n_data)]
        
        df_ad = pd.DataFrame(data=table,columns=column_name)
        
        # Mendefinisikan list kosong untuk menyimpan data ad dalam bentuk dictionary
        list_of_ad = []
        
        # Melakukan perulangan untuk mengisi list_of_ad
        for i in range(len(table['adv_title'])):
            ad = {
                'adv_title': table['adv_title'][i],
                'seller_id': table['seller_id'][i],
                'product_id': table['product_id'][i],
                'city_id': table['city_id'][i],
                'allow_bid': table['allow_bid'][i],
            }
            
            list_of_ad.append(ad)
        
        #input query
        injection_query = text("""
                    INSERT INTO ADVERTISEMENT(adv_title,seller_id,product_id,city_id,allow_bid)
                    VALUES(:adv_title,:seller_id,:product_id,:city_id,:allow_bid)
                    """)
        
        #eksekusi inject per baris data
        for rows in list_of_ad:
            
            self.sql_source.execute(injection_query, rows)
        
        #injeksi data
        self.sql_source.commit()
        
        print(df_ad)
        
        return list_of_ad
    
    
    def dummy_nego(self):
        
        n_data = int(input('''
                           Masukkan jumlah baris dummy yang anda ingin ciptakan:
                           ----------------------------------------------------\n
                           '''))
           
        #read advertisement source   
        sql_query_adv = text("SELECT * FROM ADVERTISEMENT")
        df_adv = psql.read_sql(sql_query_adv, con=self.sql_source)
        
        #read buyer source   
        sql_query_buyer = text("SELECT * FROM BUYER")
        df_buyer = psql.read_sql(sql_query_buyer, con=self.sql_source)
        
        #read max min price data car   
        sql_max_min_price = text('''
                                SELECT 
                                MAX(PRICE) as MAX_PRICE,
                                MIN(PRICE) as MIN_PRICE
                                FROM CAR;
                               ''')
        df_max_min_price = psql.read_sql(sql_max_min_price, con=self.sql_source)
        
        min_price = df_max_min_price.loc[0,'min_price']
        max_price = df_max_min_price.loc[0,'max_price']
        
        print(f'''
              min_price : {min_price}
              max_price : {max_price}
              \n''')
        
        adv_ids = [random.choice(df_adv['adv_id']) for i in range(n_data)]
        adv_ids = list(map(int, adv_ids))
        
        buyer_ids = [random.choice(df_buyer['buyer_id']) for i in range(n_data)]
        buyer_ids = list(map(int, buyer_ids))
        
        bid_prices = [random.uniform(min_price, max_price) for i in range(n_data)]
        print(f'''
              Penawaran : {bid_prices}\n
              ''')
        
        
        column_name=['adv_id','buyer_id','bid_price','nego_bid']
        
        table = {}

        table['adv_id']=adv_ids
        table['buyer_id']=buyer_ids
        table['bid_price'] = bid_prices
        table['nego_bid'] = [random.choice([True, False]) for i in range(n_data)]
        
        df_nego = pd.DataFrame(data=table,columns=column_name)
        
        # Mendefinisikan list kosong untuk menyimpan data nego dalam bentuk dictionary
        list_of_nego = []
        
        # Melakukan perulangan untuk mengisi list_of_nego
        for i in range(len(table['adv_id'])):
            nego = {
                'adv_id': table['adv_id'][i],
                'buyer_id': table['buyer_id'][i],
                'bid_price': table['bid_price'][i],
                'nego_bid': table['nego_bid'][i]
            }
            
            list_of_nego.append(nego)
            
        print(list_of_nego)
        
        #input query
        injection_query = text("""
                    INSERT INTO NEGOTIATION(adv_id,buyer_id,bid_price,nego_bid)
                    VALUES(:adv_id,:buyer_id,:bid_price,:nego_bid)
                    """)
        
        #eksekusi inject per baris data
        for rows in list_of_nego:
            
            self.sql_source.execute(injection_query, rows)
        
        #injeksi data
        self.sql_source.commit()
        
        print(df_nego)
        
        return list_of_nego
        
