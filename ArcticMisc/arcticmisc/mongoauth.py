#! /usr/bin/env python
##
#     File Name           :     mongoauth.py
#     Created By          :     Anton Kundenko anton@algotradinghub.com
#     Creation Date       :     26-07-2016 16:35
#     Description         :      
##
from os import environ as e

def get_mongo_creds(*args, **kwargs):
    credstore = {'db_all': [e['LOGIN_ALL'], e['PASS_ALL']], 'db_ro': [e['LOGIN_RO'], e['PASS_RO']], 'db_rw': [e['LOGIN_RW'], e['PASS_RW']]}
    class Creds:
        user,password = credstore['db_all']
    return Creds()

