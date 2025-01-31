## Project Overview

There’s no existing system to monitor the patients while they are taken to the hospital by emergency vehicles in Sri Lanka. In some scenarios, due to the lack of facilities and resources, patients are transferred from one hospital to another hospital. This can be inconvenient for both parties; the patient and the hospital. It might be a risk to the patient’s life as well. Even after admitting to the hospital, it may take some time to arrange things for the patient and check the status of the patient. Other than the test results, the Status and the condition of the patient are normally conveyed by a guardian of the patient and there can be reliability issues in such information. 

These problems can be addressed separately by a real-time monitoring device for checking the status of the patient and a location tracking system for the ambulance which is connected to a cloud such that hospitals can get information and take decisions. As an example, they can monitor the real-time status of the patient (pulse rate, heart rate etc.) together with a summary report of the patient, and can get the predictions at which time a particular ambulance reaches their hospital. So that hospital staff will get enough time to do the necessary arrangements for that patient and allocate their staff appropriately. Not only that, when considering the emergency vehicle service side(ambulance) they can track the nearest available hospitals for this particular patient after submitting his/her pre-conditions. So, they can directly take patients to the appropriate hospitals without wasting the time. 


## Solution Architecture
![final sol arc](https://user-images.githubusercontent.com/99112218/213088203-3f11ba14-f29a-42f8-93ad-609ec4bc50ac.png)


## Hardware and Software Designs
### Hardware Components
**NodeMCU ESP8266**\
![nodemcu](https://user-images.githubusercontent.com/73444543/208266752-962d3ed1-1adb-4f89-8e55-7af7f72bf5d0.jpg)

Microcontroller is like brain of the system because it communicates with inputs and outputs and controls the entire operation of the system. Here we are using NodeMCU ESP8266 as the Microcontroller.It consists of inbuilt WIFI module. Reading longitude and latitude from GPS modem, reading health parameters of the patient from the sensors, desplaying them on a user interfaces and send these data to the cloud are the various functions of the Microcontroller.</p>
</kbd>
**GPS Modem NEO6MV2**\
 ![gps](https://user-images.githubusercontent.com/73444543/199442004-74162ede-0182-4212-aa7d-c7a19581b212.jpg)

Main function of GPS modem is provide longitude and latitude of the ambulance to the Microcontroller. It receives data from satellite and transfer them into Microcontroller through serial communication. As ambulance moves along the way from patient’s home to hospital, the co- ordinates of ambulance location will change and these variations are given to Microcontroller.

**Heart Rate Oxygen Pulse Sensor Module MAX30100**\
![bpm](https://user-images.githubusercontent.com/73444543/204417296-e6cda821-8f3d-4506-a4fd-d3d5342bab45.jpg)

MAX30100 is a multipurpose sensor used for multiple applications. It is a heart rate monitoring sensor along with a pulse oximeter. The sensor comprises two Light Emitting Diodes, a photodetector, and a series of low noise signal processing devices to detect heart rate and to perform pulse oximetry.

**Temperature Sensor Module DS18B20**\
![ds18b20resized](https://user-images.githubusercontent.com/99112218/208659438-76b42ed4-c910-433f-9a26-5005fc724ff0.jpg)

DS18B20 digital temperature sensor works on a single bus and it has 64-bit ROM to store the serial number of component. It can get quite a few DS18B20 sensors connected to a single bus in parallel. With a microcontroller, you can control so many DS18B20 sensors that are distributed around a wide range.

## Circuit Diagram & Pin Configuration
![circuitdiagramNEW](https://user-images.githubusercontent.com/99112218/213085829-2b523805-998f-4f3f-ac11-d4a6c315d63f.png)
![PINCONFIGURATION_new](https://user-images.githubusercontent.com/99112218/213085870-5b0343ae-50dc-461d-8995-a96f0e7309f4.png)

## Technology Stack
The technologies we used for build up our system is as follows.

- For the cloud server system ***AWS IoT Core*** has been used which allows clients to publish and subscribe messages related to different topics.
- There're main 3 categories as the clients. namely; Hardware device which programmed using ***Arduino IDE*** & ***C++***, Web application and Mobiles Application which are creted usig ***Flutter***.
- All these 3 clients use ***MQTT*** protocol to communicate with the thing in IoT core and in there these messages are handled by ***MQTT message broker*** 
- Web application and mobile application retrieve data from database which created using ***Amazon DynamoDB*** through two gateways which implemented using ***Amazon API Gateway*** which consists of a collection of ***REST APIs***
- ***HTTP*** protocol is used in this process and relevant functions are implemented inside ***AWS Lambda*** to retrieve data from ***Amazon Dynamo DB***

![techstack](https://user-images.githubusercontent.com/73444543/208270790-d2a1e0a0-7d49-4aeb-9ad7-38f038d42e62.jpg)

## DataBase
In this system two main information has to be stored.
- ***User Credential details*** which are usefull when login to the web application and the mobile application.
- ***Information about Hospitals*** which areuseful when suggesting nearest hospitals and connecting with them.

***User Credential Details***
| <ins>Device ID</ins> | Password |
|---------|--------|

***Hopitals details***
| <ins>Hospital ID</ins> | Contact No | Hospital Name | Lattitude | Longitude |
|----------------------|----------|-------------|---------|--------|

Mainly 3 AWS services are useful in the data retrieving & storing process in the database.
- For the Database ***Amazon Dynamo DB*** which is fully managed, serverless, key-value NoSQL databasehas been used. It consists of built-in security, continuous backups, automated multi-Region replication, in-memory caching, and data import and export tools.
- Functions to aceess the database are implemented inside ***AWS Lambda*** which lets to run code for virtually any type of application or backend service without managing a server.
- To create and  RESTful APIs which enables real-time two-way communication applications ***Amazon API Gateway*** is used.
(Here REST APIs act as the front door for applications to access data, business logic, or functionality from the backend services)

![lambda](https://user-images.githubusercontent.com/73444543/208267083-d9dab665-57b0-40a7-b8e2-d419366a0e64.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![db](https://user-images.githubusercontent.com/73444543/208336664-b201ac26-5692-4275-b22a-7baaf43c4f17.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![gateway](https://user-images.githubusercontent.com/73444543/208334345-2bbf3fb7-1fe6-446e-89a5-0c800eb428da.png)

## UI Design 
## Mobile Application
![1](https://user-images.githubusercontent.com/99112218/213088470-128a50bf-4ff5-4d0b-b656-fcf2cb2b44b0.jpg)
![2](https://user-images.githubusercontent.com/99112218/213088474-ace8193d-6c55-4f9f-b0fd-54aefebcfe41.jpg)
![3](https://user-images.githubusercontent.com/99112218/213088476-50be8315-964d-4592-a849-ba169eb2fd53.jpg)
![4](https://user-images.githubusercontent.com/99112218/213088479-03c007b3-3432-44fc-bfbe-a32b308095fe.jpg)
![5](https://user-images.githubusercontent.com/99112218/213088483-ed9695f2-ba86-449e-a14d-51d5c0537e89.jpg)
![6](https://user-images.githubusercontent.com/99112218/213088485-60761ae6-adbe-4c4b-b416-353712c09fb8.jpg)

### Web Site
![1](https://user-images.githubusercontent.com/99112218/213088548-7db9c35f-f8cb-4bde-b9a0-71243a4ec2bd.png)
![2](https://user-images.githubusercontent.com/99112218/213088551-a2472ef1-f2d5-488e-811e-75785bad175a.png)
![3](https://user-images.githubusercontent.com/99112218/213088554-cc4652c0-beee-4d09-a8c9-99e343e0b3c3.png)
![4](https://user-images.githubusercontent.com/99112218/213088556-e30cc3de-ec19-4bca-ad93-060a0dc471e1.png)
![5](https://user-images.githubusercontent.com/99112218/213088560-f5f91245-16da-4988-b252-3c0a56570d7c.png)
![6](https://user-images.githubusercontent.com/99112218/213088562-4f577ad0-4cd8-4062-afd5-1aad500dc916.png)
![pdf](https://user-images.githubusercontent.com/99112218/213088566-8726d919-0612-486f-b482-5b26c718f57f.png)


## Wire frames
### Mobile Application
![1](https://user-images.githubusercontent.com/73444543/204421741-097ead06-a8a0-42b7-9909-e57f2a42749c.jpeg) ![2](https://user-images.githubusercontent.com/73444543/204421756-5044ca8f-5539-4fd2-b548-d2fb9653f210.jpeg) ![3](https://user-images.githubusercontent.com/73444543/204421865-6246a490-6792-408c-a3ea-ab60dfa75b5d.jpeg) ![4](https://user-images.githubusercontent.com/73444543/204421896-f72edcda-189b-4d0e-97a7-b8929cb37fd3.jpeg) ![5](https://user-images.githubusercontent.com/73444543/204421907-ea42e1c7-7321-4937-9499-7467ccd4c7ee.jpeg) ![6](https://user-images.githubusercontent.com/73444543/204422174-d54a3402-d738-479d-ab6f-304f281294c5.jpeg)

### Web Site
![11](https://user-images.githubusercontent.com/73444543/204422296-5a30311c-bf57-4a55-996f-d5d61a02d51a.jpeg)
 ![12](https://user-images.githubusercontent.com/73444543/204422309-84cb99e1-f864-49a1-9c4f-e5c02b12adcd.jpeg) \
![13](https://user-images.githubusercontent.com/73444543/204422321-a20edf16-2f6c-4c07-8dac-eb6b77541fa5.jpeg)
 ![14](https://user-images.githubusercontent.com/73444543/204422332-05087242-e46a-4c22-b2f7-2df2d15c888b.jpeg)







## Testing

|**Testing Type** | **Functionlities to be checked** | **Software used** |
|-------------|------------------------------|--------------|
|[Hardware Testing | Input data from sensors | Platform.io ![platformio](https://user-images.githubusercontent.com/73444543/208268165-b5c0ded8-0424-4fca-b804-30b91765a0a7.png)|
|Web-Application Testing|Login validation | Flutter driver ![driver](https://user-images.githubusercontent.com/99112218/213087920-c6e654e2-c6c0-4275-9beb-3933d4cca2af.png) |
|Mobile Application Testing | Login validation | Flutter driver ![driver](https://user-images.githubusercontent.com/99112218/213087920-c6e654e2-c6c0-4275-9beb-3933d4cca2af.png) |
|API Testing | GET ,DELETE ,PUT requests about users and hospitals| Postman ![postman](https://user-images.githubusercontent.com/73444543/208268493-e550219f-5ca8-47c0-a08b-8120ec53b8fa.png) |

## Security Aspects

- User credentials for both the end users (hospitals, medical officers)
- Connection to the app is authorized by the device
- MQTT - Authentication - AWS certificates
- MQTT - Authorization - AWS Policies
- HTTP - Authentication - AWS certificates
- HTTP - Authorization - AWS Roles
- Both are end-to-end encrypted

## Detailed Budget
|**Item** | **Quantity** | **Price (LKR)** |
|-----|----------|------|
|NodeMCU ESP8266 CP2102 | 1 |2000|
|Temperature Sensor DS18B20 | 1 | 480 |
|Heart rate & Oxygen sat. level sensor MAX30100 | 1 | 900 |
|GPS Modem NEO6MV2| 1 | 1700 |
|GSM sensor SIM800L | 1 | 2250 |
|128 x 64 Oled mini display 0.96 inch | 1 | 870 |
|Female to female jumper wires(40pcs) | 1 | 220 |
|Push button, Switch | 1 | 80 |
|Copper board (5cm x 7cm) | 1 | 250 |
|4.7k Ohm resistor, LED strips | 2 | 250 |
|Outer cover & Other | - | 3000 |
|Total ||<ins><ins>12000</ins></ins>|



## Conclusion

Currently, there’s no system for real-time patient monitoring and updating the hospital from the ambulance exists. Normally medical officers/nurses in there will contact hospitals via mobile calls in critical situations which are not that reliable. And there’s no location tracking or time prediction system for ambulances that exists. Also, in case of finding a suitable hospital, ambulances prefer the nearest hospital or general hospital without considering the conditions or facilities available at the moment which will be caused previously mentioned issues. Considering the current situation regarding this matter, this project will be able to highly contribute to rebuilding this system.
