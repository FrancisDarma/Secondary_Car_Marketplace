from dummy_creator import DummyCreator
from sql_connector import connect_data

def main_menu():  
    
    input_main_menu=input(
        '''
        Pilih Table Data Dummy yang Anda ingin generate:
        1. Seller
        2. Buyer
        3. Advertisement
        4. Negotiation
        5. Exit Program
        
        '''
    )
    
    dummy_generator = DummyCreator(sql_source=connect_data())
    
    if input_main_menu=='1':
        
        seller_data = dummy_generator.dummy_seller()
        
        main_menu()
        
    elif input_main_menu=='2':
        
        buyer_data = dummy_generator.dummy_buyer()
        
        main_menu()
        
    elif input_main_menu=='3':
        
        adv_data = dummy_generator.dummy_adv()
        
        main_menu()
        
    elif input_main_menu=='4':
        
        nego_data = dummy_generator.dummy_nego()
        
        main_menu()
        
    elif input_main_menu=='5':
        
        print('''
              ---------------------------------
              Keluar dari Program
              ---------------------------------
              ''')
        
    else :

        print('''
              ----------------------------------
              Tolong masukkan input yang sesuai
              ----------------------------------
              ''')
        
        main_menu()

main_menu()