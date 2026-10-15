# Cloud Networking Deep Dive

### 1. Architectural Foundations: VNet, Subnet, and NSG
* **Virtual Network (VNet):** A VNet is an isolated, logically distinct private network space within the cloud provider's infrastructure. It acts as your primary security boundary. No traffic can enter or leave a VNet unless explicitly configured via gateways, peering, or public endpoints.
* **Subnet:** A subnet is a structural segmentation of a VNet's IP address range. Subnets are used to isolate different tiers of an application (e.g., placing web front-ends in a public subnet, and SQL databases in a private subnet with no direct internet access) to enforce the principle of least privilege.
* **Network Security Group (NSG):** An NSG is a stateful packet-filtering virtual firewall. It contains a list of Access Control List (ACL) rules that allow or deny traffic based on source/destination IP, port, and protocol (TCP/UDP). They can be applied directly to a network interface (NIC) or to an entire subnet.

### 2. Name Resolution: What DNS is and the `github.com` Workflow
* **Domain Name System (DNS):** DNS is a globally distributed, hierarchical database that resolves human-readable Domain Names into machine-readable IP addresses. 
* **The Workflow when typing `github.com`:**
  1. **Local Cache Check:** Your browser and OS check their local caches to see if they already know the IP address.
  2. **Recursive Resolver:** If not cached, the request goes to your ISP or a recursive resolver (like `8.8.8.8`).
  3. **The Root and TLD Search:** The resolver queries the DNS Root Servers, which point to the `.com` Top-Level Domain (TLD) servers.
  4. **Authoritative Nameserver:** The `.com` server points to GitHub's Authoritative Nameserver, which holds the definitive record.
  5. **Connection:** The IP (e.g., `140.82.121.4`) is returned to your browser, and your machine initiates a TCP 3-way handshake to load the webpage.

### 3. Transport Layer Security: Port 443 and NSG Configurations
* **Port 443 (HTTPS):** This port handles Hypertext Transfer Protocol Secure traffic. Unlike standard HTTP (Port 80), all traffic over Port 443 is encrypted using Transport Layer Security (TLS/SSL). This guarantees encryption, data integrity, and authentication between the user and the web server.
* **NSG Rule Requirements:** To host an accessible web server, you must implement an **Inbound Security Rule**:
  * **Source:** `Internet`
  * **Source Port Ranges:** `*`
  * **Destination:** `Any`
  * **Destination Port Ranges:** `443`
  * **Protocol:** `TCP`
  * **Action:** `Allow`
# Cloud Networking Deep Dive

### 1. Architectural Foundations: VNet, Subnet, and NSG
* **Virtual Network (VNet):** A VNet is an isolated, logically distinct private network space within the cloud provider's infrastructure. It acts as your primary security boundary. No traffic can enter or leave a VNet unless explicitly configured via gateways, peering, or public endpoints.
* **Subnet:** A subnet is a structural segmentation of a VNet's IP address range. Subnets are used to isolate different tiers of an application (e.g., placing web front-ends in a public subnet, and SQL databases in a private subnet with no direct internet access) to enforce the principle of least privilege.
* **Network Security Group (NSG):** An NSG is a stateful packet-filtering virtual firewall. It contains a list of Access Control List (ACL) rules that allow or deny traffic based on source/destination IP, port, and protocol (TCP/UDP). They can be applied directly to a network interface (NIC) or to an entire subnet.

### 2. Name Resolution: What DNS is and the `github.com` Workflow
* **Domain Name System (DNS):** DNS is a globally distributed, hierarchical database that resolves human-readable Domain Names into machine-readable IP addresses. 
* **The Workflow when typing `github.com`:**
  1. **Local Cache Check:** Your browser and OS check their local caches to see if they already know the IP address.
  2. **Recursive Resolver:** If not cached, the request goes to your ISP or a recursive resolver (like `8.8.8.8`).
  3. **The Root and TLD Search:** The resolver queries the DNS Root Servers, which point to the `.com` Top-Level Domain (TLD) servers.
  4. **Authoritative Nameserver:** The `.com` server points to GitHub's Authoritative Nameserver, which holds the definitive record.
  5. **Connection:** The IP (e.g., `140.82.121.4`) is returned to your browser, and your machine initiates a TCP 3-way handshake to load the webpage.

### 3. Transport Layer Security: Port 443 and NSG Configurations
* **Port 443 (HTTPS):** This port handles Hypertext Transfer Protocol Secure traffic. Unlike standard HTTP (Port 80), all traffic over Port 443 is encrypted using Transport Layer Security (TLS/SSL). This guarantees encryption, data integrity, and authentication between the user and the web server.
* **NSG Rule Requirements:** To host an accessible web server, you must implement an **Inbound Security Rule**:
  * **Source:** `Internet`
  * **Source Port Ranges:** `*`
  * **Destination:** `Any`
  * **Destination Port Ranges:** `443`
  * **Protocol:** `TCP`
  * **Action:** `Allow`
