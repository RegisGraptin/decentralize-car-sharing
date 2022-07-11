

## Car sharing system


Car sharing can be defined as: "the practice of sharing a car for regular travelling". 
For example, we could have a person who wants to rent a car for making his trip. 

In the car sharing system, we have two types of person:
- Owner : The owner of the car.
- Client : The person who wants to rent a car.

### Existing companies

During our reseach, we saw exiting actors in the domain. 

Firstly, we saw companies that own car and allow you, as a customer, to rent a car. We can cite [Communauto](https://communauto.com/), [Zipcar](https://www.zipcar.com/) and [Share Now](https://www.share-now.com/).

In this case, the company acts as the owner of the cars.


TODO :: Search for companies that connects individuals.




### Purpose 

We want to enlarge the car sharing system, allowing more people to share and use their car. Indeed, during a large part of the life of a car remains in a garage. This could be a way to be more efficient in our usage. 

Moreover, this can allow us to reduce the number of car needed in a city. With more and more people, we need more and more car for them, so why not optimize our usage ?


Additionally, we want to have a simple system that can allow anyone to share his car and to rent one. We want to make sure we maintain trust throughout the process. 




At first, we do not take into consideration the deposit money for client and owner.





## Rental Contract - Car contract status

When an user want to create a contract for renting a car, we will have different steps during the process. 
We could defined that by a set of state:

- Not available: The current car is not available for renting.
- Available: The car is available for renting.
- Request: A customer have made a request by given the data and a guarantee.
- Booked: A customer and the owner of the car have found an agreement.
- Rent: The car is used by the customer.
- Return: The car is returned to the owner.

> TODO :: Add a graphic showing the possibility from the different states.


> Note: At the moment, for simplicity, we do not take into account the date for the state of the car. Indeed, when we want to rent a car, we need the car to be available. It is also possible to requets to rent the car in the future if we know if the car is available.



Code decomposition: 

RentalStructure > RentalProposition > RentalReservation > RentalFinalization > RentalContract






In this process, we will have two entities: 
- A customer who want to rent a car.
- An owner who want to share his car.

The two entities have to deposit an initial amount of value to avoid any conflicts.


## Rent process 

A client choose a car. It decided to make a proposition of a rental contract.
The owner receives that proposition, and decide to agreed on that. 
If he agrees, then the client need to make a deposit (or deposit before)

=> We have a free time for cancel the offer (let say 1 weeks before the rent)
=> Then, if one of the two parts want to cancel it, it will generate fees.


The day arrive. The owner and client need to accept the car receive/deposit.

The client do his trip.

Then client returns to the owner the car.

A phase of verification is needed.






## User information 

Trust is difficult to obtained, especially when we need to lend something to someone that we do not know. 
For a car sharing system, the client information should be verify but we also need to verify the car owner properties. 

TODO :: Define the user properties we need to check.



In our process of building a decentalized car-shraing system, we will have some issue on the user verification. 
Indeed, a questions are raised regarding the process of verification of the information about the car, the owner and the user. 
This is important to be sure that the car owner have respected the car validity, the assurance... And to knwo that the user have a driving license.

Moreover, the information about the users are important in the case of malicious actions happening. 
With this information, we can know the real person and manage that in justice court.  

A trust system based on pairs could be implemented, but we will always have issues if something in the real world happen.



Thus, at the moment, a possible solution is to have a thrid part who will acts as a KYC system.
It will assure that all the members of the network as given valid document.
It will act as an intermediary for checking and giving information when needed.

> Note: If you see other possibility do not hesitate to share it with us.


## User verification 

### Owner verification 

The owner need to proof his identity and to proof his car information and additionally the car insurance of it.

### Client verification

The client need to proof his identity.

### Process validation 

The car need to be accepted.
The client and the owner should have made a deposit.



# Research


## Project links 

- https://github.com/1inch/jobocar/tree/master/contracts
- https://github.com/mgcox/carChain

## Papers: 
Applying Smart Contracts to Secure Car Sharing Systems
Akash Madhusudan


# Data 
What should be public/private






### Process

- Owner deploys a smart contract with a deposit.
- Customer sets the number of days he wants to rent car and sends a request by deposing an amout of credit.
- Owner and customer have a mutual agreement. (booking date & price per day)
- Owner signs the booking detail using his private key and encrypts them using customer public key. Send details to the storage of smart contract and allosw cutsomer to access the car. 
- Customer use the car. When trip over, the customer ends the rental process by dropping off the owner's car at the discussed location.
- Onece the process is over, both the owenr and customer seperately withdraw their deposits and earnings.

### Data issues 

- Confidentiality of booking details: owner and customer have access to sensitive information. Discussed offline and only stored in the smart contract when encrypted.

- Condifentiality of access token; Only decrypted by the customer.

- Authenticity of booking details; owner signature on the booking detail is verified before giving access to the customer

- Non repudiation of the origin of access token


- Anonymity of consumer and car.

- Forensic evidence provision: smart contract auditable (case of incident involving the owner and consumer)

###
- carry out the whole payment process
- slash customer fraud by penalise them (penalise malicious behavior)
- Implement a cancellation functionnality
- Have a functionnality for extra time.
- Store encrypted booking information. Verify the authenticity of these details, customer and owner


## Insurance system 
- Customer steal
- Accident
- Do not manage insurance compensation
