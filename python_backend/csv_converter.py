"""
========WRITE_DATA_CSV==============
"""

#import modul yang diperlukan
import csv
import pandas as pd
import numpy as np

#membaca data rekap        
def read_data():  
    
    list_data = []
    location = []
    
    try:
            
        #buka file untuk membaca
        with open(file='D:/pacmann/ERD_project/dbase/master_data_files/city.csv',mode='r') as csvread:
                        
            #read csv
            csv_dict_read = csv.DictReader(csvread,delimiter=';')

            #tampilkan header data
            cols = csv_dict_read.fieldnames
            
            cols.append('coordinate')
                
            for row in csv_dict_read:
                latitude = float(row['latitude'])
                longitude = float(row['longitude'])
                row['coordinate'] = f'({latitude}, {longitude})'
                
                keys_to_include = ['kota_id','nama_kota','coordinate']
                
                # Create a new dictionary with only the specified keys
                subset_data = {key: row[key] for key in keys_to_include}
                list_data.append(subset_data)
                
            print(list_data)
            
        #buka file untuk membaca
        with open(file='D:/pacmann/ERD_project/dbase/master_data_files/city_compiled.csv',mode='w',newline='') as csvwrite:

            csv_write = csv.DictWriter(csvwrite, fieldnames=keys_to_include)
            
            csv_write.writeheader()
            
            csv_write.writerows(rowdicts=list_data)
        
    #memunculkan pesan terminal apabila program diberhentikan secara paksa     
    except (InterruptedError):
                
        #munculkan pesan error
        print('''
                    =============ERROR===========================
                    Error pada fungsi rekap_data:
                    Program diberhentikan secara paksa
                    =============================================
                                ''')   
                
    #tampilkan pesan error apabila ada kekeliruan indentasi pada program          
    except (IndentationError):
                
        #munculkan pesan error
        print('''
                    =============ERROR===========================
                    Error pada fungsi rekap_data:
                    Terdapat kesalahan indentasi fungsi
                    =============================================
                                ''')          
                
    #tampilkan pesan error apabila terdapat error syntax pada rekap_data  
    except (SyntaxError):
                
        #munculkan pesan error
        print('''
                    =============ERROR===========================
                    Error ada fungsi rekap_data:
                    Terdapat kesalahan syntax program
                    =============================================
                                ''')   
        
    #munculkan perintah proses rekap data berhasil  
    finally :

        #print proses berhasil/sukses
        print('''
                      ===========SUKSES============================
                      Proses rekap data sukses
                      =============================================
                      ''')
        
    return list_data

read_data()