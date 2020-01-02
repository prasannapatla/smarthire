"""
WSGI config for smarthire project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.2/howto/deployment/wsgi/
"""

import os


import os 
import time 
import traceback 
import signal 
import sys 
 

print("-----------Production server---------------")
 
sys.path.append('/var/www/smarthire/smarthire') 
# adjust the Python version in the line below as needed 
sys.path.append('/var/www/smarthire/smarthire/myenv/lib/python3.5/site-packages') 


from django.core.wsgi import get_wsgi_application 

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'smarthire.settings')
os.system("sudo chown -R :www-data /var/www/smarthire")
os.system("sudo chmod 771 -R /var/www/smarthire/")
os.system("sudo chmod 777 -R /var/www/smarthire/smarthire/myenv")
try: 
    application = get_wsgi_application() 
except Exception: 
    # Error loading applications 
    if 'mod_wsgi' in sys.modules: 
        traceback.print_exc() 
        os.kill(os.getpid(), signal.SIGINT) 
        time.sleep(2.5) 
