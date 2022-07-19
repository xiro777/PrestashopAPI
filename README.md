Installing Prestashop on Docker container

1. Firstly you need to create container. To do this open CMD and move to direction of file Docker-compose.yml
2. Create container by typing Sudo docker-compose up
3. Wait until everything will finish
4. Now you will have access to container. 
   Open web browser and type localhost:8080
   There should appear this window
   Follow steps
   ![Screenshot from 2022-07-19 09-13-51](https://user-images.githubusercontent.com/57447580/179756157-69d43526-957f-4723-9e15-626836f174e3.png)
   ![Screenshot from 2022-07-19 09-15-21](https://user-images.githubusercontent.com/57447580/179756277-56207f20-af7e-4067-9e92-6d71ab498977.png) 

   There you have to type shop name, first name,last name, email (which will be used to sign in to back-office) and password

   ![Screenshot from 2022-07-19 09-16-07](https://user-images.githubusercontent.com/57447580/179756316-c6d6d4ce-3ed9-450d-a012-9d433996f69b.png)

   In this panel you have to write database name with port(name and port is located in docker-compose.yml name: line 4 port: line: 16), database login(found in docker-compose.yml line 11) and database password(also docker-compose.yml line 10) 

   ![Screenshot from 2022-07-19 09-16-26](https://user-images.githubusercontent.com/57447580/179756542-7d54e559-0b51-45f8-ba5e-220c1cee72c2.png)
   
   After corretly typing all needed data press 'Test you database connection now!'. There should appear statement 'Database is connected' or 'Attempt to create the database automatically' which after clicking will connect to database
   
   ![Screenshot from 2022-07-19 09-16-36](https://user-images.githubusercontent.com/57447580/179757449-3b9aff46-6684-4a92-8257-08434d7eee87.png)
   
   If we got statement 'Database is connected' press 'Next' and wait until Prestashop will install
   
   ![Screenshot from 2022-07-19 09-28-04](https://user-images.githubusercontent.com/57447580/179758217-2592ba4e-721c-448d-b815-ff8e3938733a.png)

   
5. After installation Prestashop we can click at Back-Office in 'Manage your store'. There should appear this window.

   ![Screenshot from 2022-07-19 09-32-59](https://user-images.githubusercontent.com/57447580/179758629-71984a17-0fdb-41ff-9502-f39018c8d91c.png)

6. Now we have to connect to our container and remove install folder and change admin name using those 2 commands(admin123 may be any name)

   Sudo docker exec -it presta rm -rf install
   
   Sudo docker exec -it presta mv admin admin123
   
7. After executing those 2 commands we can press 'Manage your store' or just type localhost:8080/admin123 which will move us to our back office

8. In back office we have to press 'Advanced Parameters' -> 'Webservice' where we have to enable 'Enable Prestashop's Webservice' and generate key

![Screenshot from 2022-07-19 09-40-55](https://user-images.githubusercontent.com/57447580/179759309-3d6ca408-7f23-4e02-ac01-78a7824bb60a.png)


9. Generated key need to by coppied to Presta.rb to variable @api_key and to @auth username.

10. Now we have access to localhost:8080/api where username is our generated key and password is blank

