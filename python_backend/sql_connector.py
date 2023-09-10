"""
    ==============TABLE_WRITE=====================
    Modul ini berfungsi untuk menghubungkan
    dan menuliskan data ke table SQL
    =============================================
"""

#import library yang diperlukan
from sqlalchemy import create_engine, text
import psycopg2 as pg
import pandas.io.sql as psql

#definisikan fungsi untuk import data ke SQL
def connect_data():
    
    #coba jalankan kode berikut
    try:
        
        #membuat SQLite database engine
        engine = create_engine(
             'postgresql+psycopg2://postgres:4ndikacakep@localhost:5432/secondary_car_marketplace'
            )

        #membangun koneksi ke database
        conn = engine.connect()
        
        return conn
    
    #keluarkan perintah error apabila tipe dan nama input tidak sesuai 
    except (NameError, ValueError, TypeError,IndexError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table :
                    Tipe data yang dimasukkan tidak sesuai
                    =============================================
                                ''')   
                
    #memunculkan pesan terminal apabila program diberhentikan secara paksa   
    except (InterruptedError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table  :
                    Program diberhentikan secara paksa
                    =============================================
                                ''')   
    
    #tampilkan pesan error apabila ada kekeliruan indentasi pada program            
    except (IndentationError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table:
                    Terdapat kesalahan indentasi fungsi
                    =============================================
                                ''')   
    
    #tampilkan pesan error apabila terdapat error syntax pada import_data_table           
    except (SyntaxError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error ada fungsi import_data_table:
                    Terdapat kesalahan syntax program
                    =============================================
                                ''')   
        
    #tunjukkan keterangan proses sukses dilakukan
    finally :

            #print proses berhasil/sukses
            print('''
                      ===========KONEKSI SUKSES======================
                       Berhasil menghubungkan ke PostgreSQL                   
                      =============================================
                      ''')    

#definisikan fungsi untuk import data ke SQL
def import_data_seller(input_item, engine):
    
    """
    Modul ini berfungsi untuk menuliskan data ke table sql
    
    Args:
        input_item(dict): yaitu dictionary yang dihasilkan dari input data customer final
                          yaitu list_data dari fungsi rekap_data
        
    Returns:
        Fungsi ini tidak akan mengembalikan nilai dari sebuah variabel
    """
    
    #coba jalankan kode berikut
    try:

        #membangun koneksi ke database
        conn = engine.connect()
        
        #input query
        query = text("""
                    INSERT INTO transaksi(id_pembeli,nama_barang,jumlah_barang,harga_barang,kota,total_harga,diskon,harga_diskon)
                    VALUES(:id_pembeli,:nama_barang,:jumlah_barang,:harga_barang,:kota,:total_harga,:diskon,:harga_diskon)
                    """)
        
        #eksekusi inject per baris data
        for rows in input_item:
            
            conn.execute(query, rows)
        
        #injeksi data
        conn.commit()
        
        #tutup koneksi data
        conn.close()
    
    #keluarkan perintah error apabila tipe dan nama input tidak sesuai 
    except (NameError, ValueError, TypeError,IndexError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table :
                    Tipe data yang dimasukkan tidak sesuai
                    =============================================
                                ''')   
                
    #memunculkan pesan terminal apabila program diberhentikan secara paksa   
    except (InterruptedError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table  :
                    Program diberhentikan secara paksa
                    =============================================
                                ''')   
    
    #tampilkan pesan error apabila ada kekeliruan indentasi pada program            
    except (IndentationError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error pada fungsi import_data_table:
                    Terdapat kesalahan indentasi fungsi
                    =============================================
                                ''')   
    
    #tampilkan pesan error apabila terdapat error syntax pada import_data_table           
    except (SyntaxError):
                
            #munculkan pesan error
            print('''
                    =============ERROR===========================
                    Error ada fungsi import_data_table:
                    Terdapat kesalahan syntax program
                    =============================================
                                ''')   
        
    #tunjukkan keterangan proses sukses dilakukan
    finally :

            #print proses berhasil/sukses
            print('''
                      ===========INPUT SUKSES======================
                      Proses inject data ke SQL pada fungsi 
                      import_data_table berhasil dilakukan                      
                      =============================================
                      ''')    
        