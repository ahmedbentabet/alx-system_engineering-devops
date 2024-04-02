# Project: 0x09. Web infrastructure design

## Resources

#### Read or watch:

* [Network basics concept page]()
* [Server concept page]()
* [Web server concept page]()
* [DNS concept page]()
* [Load balancer concept page]()
* [Monitoring concept page]()
* [What is a database](https://intranet.alxswe.com/rltoken/n3CdS3EA5l5psDDKbEhApA)
* [What's the difference between a web server and an app server?](https://intranet.alxswe.com/rltoken/0as4wDlFqyhLhf0f_gedcw)
* [DNS record types](https://intranet.alxswe.com/rltoken/Pl3UoEfAO7K_jUKRLMmnAQ)
* [Single point of failure](https://intranet.alxswe.com/rltoken/uxpx2YhXs10TFLIDg78chA)
* [How to avoid downtime when deploying new code](https://intranet.alxswe.com/rltoken/4ansLu2gtHnoFrNThqyObA)
* [High availability cluster (active-active/active-passive)](https://intranet.alxswe.com/rltoken/TAJeVYy9U9iLaEDd6XkbRA)
* [What is HTTPS](https://intranet.alxswe.com/rltoken/c0zs2MxrmxFLsCPOizxq6g)
* [What is a firewall](https://intranet.alxswe.com/rltoken/j6idMcUTyNEDj1oYDQFmUw)
## Learning Objectives

### General

* You must be able to draw a diagram covering the web stack you built with the sysadmin/devops track projects
* You must be able to explain what each component is doing
* You must be able to explain system redundancy
* Know all the mentioned acronyms: LAMP, SPOF, QPS
## Tasks

| Task | File |
| ---- | ---- |
| 0. Simple web stack | [0-simple_web_stack](./0-simple_web_stack) |
| 1. Distributed web infrastructure | [1-distributed_web_infrastructure](./1-distributed_web_infrastructure) |
| 2. Secured and monitored web infrastructure | [2-secured_and_monitored_web_infrastructure](./2-secured_and_monitored_web_infrastructure) |

### 0. Simple web stack (One-Server Web Infrastructure Design)

#### Scenario:

A user wants to access the website hosted at www.foobar.com.

#### Components:

1. **Server:**

   - The server is a physical or virtual machine that hosts the entire web infrastructure.

2. **Web Server (Nginx):**

   - Nginx is a popular web server software that serves web content to users' browsers upon request.

3. **Application Server:**

   - The application server hosts the application codebase and executes dynamic code to generate web pages.

4. **Application Files (Codebase):**

   - This includes the source code, scripts, and resources required to run the website's application logic.

5. **Database (MySQL):**

   - MySQL is a relational database management system used to store and manage website data, such as user information, content, and settings.

6. **Domain Name (www.foobar.com):**
   - The domain name acts as the human-readable address for the website, translating into the server's IP address (e.g., 8.8.8.8) using DNS.

#### Specifics:

1. **What is a server?**

   - A server is a computer system or software that provides services or resources to other computers, known as clients, over a network. In this context, it hosts the web infrastructure components.

2. **Role of the domain name:**

   - The domain name provides a user-friendly way to access websites by mapping human-readable names (like www.foobar.com) to IP addresses (like 8.8.8.8) using DNS.

3. **Type of DNS record "www" in www.foobar.com:**

   - The "www" in www.foobar.com is a subdomain, and it typically corresponds to a CNAME (Canonical Name) DNS record, which points to the main domain's A record (address record).

4. **Role of the web server:**

   - The web server (Nginx) receives incoming HTTP requests from users' browsers and serves static content, forwards dynamic requests to the application server, and returns generated web pages to the users.

5. **Role of the application server:**

   - The application server executes the application's codebase, processes dynamic requests, interacts with the database to retrieve or store data, and generates HTML content dynamically for the web server to serve.

6. **Role of the database:**

   - The database (MySQL) stores and manages structured data required for the website, such as user profiles, articles, comments, and settings. It allows efficient data retrieval and manipulation for the application server.

7. **Communication with the user's computer:**
   - The server communicates with the user's computer over the internet using the HTTP (Hypertext Transfer Protocol) or HTTPS (HTTP Secure) protocol. When a user accesses www.foobar.com, their browser sends an HTTP request to the server, which responds with the requested web page.

#### Issues with this Infrastructure:

1. **Single Point of Failure (SPOF):**

   - Since all components are hosted on a single server, any failure in hardware, software, or network connectivity can result in downtime for the entire website.

2. **Downtime during maintenance:**

   - Performing maintenance tasks, such as deploying new code or updating server configurations, may require restarting the web server. During this time, the website may experience downtime, impacting user accessibility.

3. **Scalability limitations:**
   - The infrastructure may struggle to handle high volumes of incoming traffic, leading to performance issues or website crashes during peak times. Scaling resources, such as adding more servers or implementing load balancing, becomes challenging in this setup.

### 1. Distributed web infrastructure (Three-Server Web Infrastructure Design)

1. **Why add additional servers?**

   - Distributing components across multiple servers improves fault tolerance, scalability, and performance isolation.

2. **Why add a load balancer?**

   - The load balancer (HAProxy) distributes traffic across multiple application servers to prevent overloading any single server and improve reliability and scalability.

3. **Distribution algorithm for the load balancer:**

   - The load balancer is configured with a Round Robin distribution algorithm, ensuring even distribution of traffic across all available application servers.

4. **Active-Active vs. Active-Passive setup:**

   - The load balancer enables an Active-Active setup, where all application servers actively handle incoming requests simultaneously, maximizing resource utilization and minimizing response time.

5. **How a database Primary-Replica cluster works:**

   - In this setup, both Server 2 and Server 3 act as Replica Database Servers, replicating data from the Primary Database Server (Server 1). This Primary-Replica replication ensures data redundancy, fault tolerance, and improved read performance.

6. **Difference between Primary and Replica nodes in regard to the application:**
   - The Primary Database Server (Server 1) handles write operations and serves as the authoritative source of data. The application primarily interacts with the Primary node for updating or retrieving data. Replica Database Servers (Server 2 and Server 3) serve as backups and handle read-only requests, improving read scalability and availability.

#### Issues with this Infrastructure:

1. **Single Points of Failure (SPOF):**

   - Despite having multiple servers, each server still represents a potential single point of failure. For example, if the Primary Database Server fails, it may lead to downtime or data loss until failover mechanisms are activated.

2. **Security Issues:**

   - Lack of firewall protection and HTTPS encryption leaves the infrastructure vulnerable to cyber threats and data breaches. Implementing proper security measures is essential to protect sensitive data and ensure secure communication between clients and servers.

3. **No Monitoring:**
   - Without monitoring tools in place, it's challenging to detect and respond to performance issues, security breaches, or infrastructure failures in real-time. Monitoring is crucial for maintaining the health and performance of the web infrastructure.

### 2. Secured and monitored web infrastructure (Three-Server Web Infrastructure Design : Secured, Encrypted & Monitored)

1. **Why add firewalls?**

   - Firewalls are added to control network traffic and restrict access to the servers, protecting them from unauthorized access and potential security threats.

2. **Why serve traffic over HTTPS?**

   - Serving traffic over HTTPS encrypts data transmitted between the server and clients, ensuring confidentiality and integrity of sensitive information (such as login credentials, personal data, etc.).

3. **What is monitoring used for?**

   - Monitoring is used to track the health and performance of the infrastructure, identify security incidents, troubleshoot issues, and optimize resource usage.

4. **How is monitoring data collected?**

   - Monitoring clients (e.g., Sumo Logic) installed on each server collect data on system metrics, application logs, and security events. This data is then aggregated and analyzed by the monitoring service to provide insights into the health and performance of the infrastructure.

5. **Monitoring web server QPS:**
   - To monitor web server QPS (Queries Per Second), you would configure the monitoring tool to collect and analyze data on incoming HTTP requests to the web servers. This would involve tracking metrics such as request count, response time, and error rates.

#### Issues with this Infrastructure:

1. **Terminating SSL at the load balancer level:**

   - Terminating SSL at the load balancer may introduce a potential security risk, as decrypted traffic is then forwarded to the backend servers. Proper security measures should be implemented to protect the communication between the load balancer and backend servers.

2. **Having only one MySQL server capable of accepting writes:**

   - Having a single MySQL server capable of accepting writes introduces a single point of failure. If this server fails, it can lead to downtime and data loss. Implementing database replication and failover mechanisms can help mitigate this risk.

3. **Servers with all the same components:**
   - Having servers with identical components may lead to a lack of fault tolerance and scalability. It's essential to distribute components across servers and implement redundancy to ensure high availability and performance under varying load conditions.
