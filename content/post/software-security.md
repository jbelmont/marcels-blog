+++
date = "2017-08-18T12:00:00"
draft = false
tags = ["Security", "OWASP"]
title = "OWASP and Software Security"
math = true
summary = """
Deep Dive into OWASP Top 10 and Software Security
"""

+++

* [Software Security](#software-security)
    * [Difference between Software Security and Application Security](#difference-between-software-security-and-application-security)
* [Language-Based Security](#language-based-security)
    * [Objectives of Language Based Security](#objectives-of-language-based-security)
* [Application Level Security](#application-level-security)
    * [Definition](#definition)
    * [Terms](#terms)
    * [Techniques](#techniques)
    * [Application threats or attacks](#application-threats-or-attacks)
* [OWASP](#owasp)
    * [Background on OWASP](#background-on-owasp)
    * [OWASP Core Values](#owasp-core-values)
    * [OWASP Principles](#owasp-principles)
    * [OWASP Mailing Lists](#owasp-mailing-lists)
    * [OWASP Chapter](#owasp-chapter)
    * [OWASP Membership](#owasp-membership)
    * [OWASP Projects](#owasp-projects)
    * [OWASP Github Organization](#owasp-github-organization)
    * [OWASP Member Portal](#owasp-member-portal)
    * [OWASP Top 10](#owasp-top-10)
    * [OWASP Top 10 comparsion table for 2013 vs 2017](#owasp-top-10-comparison-table-for-2013-vs-2017)
* [Github Repository](#github-repository)

##  Software Security

* Software security entails software that continues to function correctly under malicious attack.
* Most engineers acknowledge that security is important but don't know the steps to tackle security
* Software security best practices leverage good software engineering practice
    * Involve thinking about security early in the software lifecycle, knowing and understanding common threats
    * Including language-based flaws and pitfalls
    * designing for security
    * Putting all software components thorough objective risk analyses and testing.

### Difference between Software Security and Application Security

[Gary McGraw](https://www.garymcgraw.com/)

> Gary McGraw maintains that application security is a reactive approach, taking place once software has been deployed. Software security, on the other hand, involves a proactive approach, taking place within the pre-deployment phase.

[Difference between Software Security and Application Security](https://www.synopsys.com/blogs/software-security/application-security-vs-software-security/)

Software security (pre-deployment) activities include:

* Secure software design
* Development of secure coding guidelines for developers to follow
* Development of secure configuration procedures and standards for the deployment phase
* Secure coding that follows established guidelines
* Validation of user input and implementation of a suitable encoding strategy
* User authentication
* User session management
* Function level access control
* Use of strong cryptography to secure data at rest and in transit
* Validation of third-party components
* Arrest of any flaws in software design/architecture

Application security (post-deployment) activities include:

* Post deployment security tests
* Capture of flaws in software environment configuration
* Malicious code detection (implemented by the developer to create backdoor, time bomb)
* Patch/upgrade
    * Meaning that situations like third party software or dependencies needing to be patched
* IP filtering
    * White List Known Good IP addresses instead of leaving a bunch IP addresses open
* Lock down executables
    * This in my mind goes more hand in hand with compiled languages but I could be wrong
* Monitoring of programs at runtime to enforce the software use policy

## Language-Based Security

[Language Based Security](https://en.wikipedia.org/wiki/Language-based_security)

> Language-based security (LBS) is a set of techniques that may be used to strengthen the security of applications on a high level by using the properties of programming languages. LBS is considered to enforce computer security on an application-level, making it possible to prevent vulnerabilities which traditional operating system security is unable to handle.

### Objectives of Language Based Security

Objective of Language-based security:

* Prevent common programming errors such as allowing buffer overflows and illegal information flows to occur
* Provide some proof to the consumer about the security properties of the software
    * Helps the consumer trust the software without having to check source code for errors.

* A compiler, taking source code as input, performs several language specific operations on the code
    * Lexical analysis, preprocessing, parsing, semantic analysis, code generation, and code optimization
    * By analyzing the source code and gathering best practices for the language
    * The compiler will attempt to correctly translate the high-level code into low-level code
        * Preserving the behavior of the program.

**For Dynamic Libraries such as Javasript/Node.js you can use tools such as eslint that help with static analysis and best practices that you should follow**

## Application Level Security

### Definition

* Encompasses measures taken to improve the security of an application
    * By finding, fixing and preventing security vulnerabilities.

### Terms

* Asset
    * Data in a database, money in an account, file on the filesystem or any system resource.
* Vulnerability
    * A gap in security program that can be exploited by threats to gain unauthorized access to an asset.
* Attack
    * An action taken to harm an asset.
* Threat
    * Anything that can exploit a vulnerability and obtain, damage, or destroy an asset.

### Techniques

* Code review
    * Security engineer who understands the application through manually reviewing the source code notices avenues of exploit.
* Blackbox security audit
    * This is testing an application for security vulnerabilities not looking at source code
* Design review
    * Thinking about possible threat models before writing code or using a spec that has it detailed.
* Tooling
    * Automated tools that check security vulnerabilities

### Application threats or attacks

| `Category` | `Threats / Attacks` |
| --- | --- |
| *Input Validation* | Buffer overflow; cross-site scripting; SQL injection; canonicalization |
| *Software Tampering* | Attacker modifies an existing application's runtime behavior to perform unauthorized actions; exploited via binary patching, code substitution, or code extension |
| *Authentication* | Network eavesdropping ; Brute force attack; dictionary attacks; cookie replay; credential theft |
| *Authorization* | Elevation of privilege; disclosure of confidential data; data tampering; luring attacks |
| *Configuration management* | Unauthorized access to administration interfaces; unauthorized access to configuration stores; retrieval of clear text configuration data; lack of individual accountability; over-privileged process and service accounts |
| *Sensitive information* | Access sensitive code or data in storage; network eavesdropping; code/data tampering |
| *Session management* | Session hijacking; session replay; man in the middle |
| *Cryptography* | Poor key generation or key management; weak or custom encryption |
| *Parameter manipulation* | Query string manipulation; form field manipulation; cookie manipulation; HTTP header manipulation |
| *Exception management* | Information disclosure; denial of service |
| *Auditing and logging* | User denies performing an operation; attacker exploits an application without trace; attacker covers his or her tracks |

[Application Security](https://en.wikipedia.org/wiki/Application_security)

## OWASP

*The Open Web Application Security Project (OWASP)*

### Background on OWASP

* Mission is to make software security visible, so that individuals/organizations can make informed decisions.
* Operates as a community of security minded professionals
* OWASP issues software tools and knowledge-based documentation on application security.
* The OWASP Foundation came online on December 1st 2001 it was established as a not-for-profit charitable org
* In the United States on April 21, 2004 to ensure the ongoing availability and support for our work at OWASP.
* OWASP is an international organization and the OWASP Foundation supports OWASP efforts around the world.

### OWASP Core Values

* OPEN Everything at OWASP is radically transparent from our finances to our code.
* INNOVATION OWASP encourages and supports innovation and experiments for solutions to software security challenges.
* GLOBAL Anyone around the world is encouraged to participate in the OWASP community.
* INTEGRITY OWASP is an honest and truthful, vendor neutral, global community.

### OWASP Principles

* Free & Open
* Governed by rough consensus & running code
* Abide by a code of ethics (see ethics)
* Not-for-profit
* Not driven by commercial interests
* Risk based approach

### OWASP Mailing Lists

[Mailing Lists](https://lists.owasp.org/mailman/listinfo)

### OWASP Chapter

[Triangle OWASP Chapter](https://www.owasp.org/index.php/Triangle)

### OWASP Membership

[OWASP Members](https://www.owasp.org/index.php/Membership)

### OWASP Projects

[OWASP Projects](https://www.owasp.org/index.php/Category:OWASP_Project)

### OWASP Github Organization

[OWASP Github](https://github.com/OWASP)

### OWASP Member Portal

[Member Portal](https://www.owasp.org/index.php/Portal)

### OWASP Top 10

[Top 10](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project#tab=OWASP_Top_10_for_2017_Release_Candidate)

We will be reviewing the OWASP top 10 list for this workshop

OWASP Top 10 Most Critical Web Application Security Risks (in the Release Candidate) are:
* Injection
* Broken Authentication and Session Management
* Cross-Site Scripting (XSS)
* Broken Access Control (As it was in 2004)
* Security Misconfiguration
* Sensitive Data Exposure
* Insufficient Attack Protection (NEW)
* Cross-Site Request Forgery (CSRF)
* Using Components with Known Vulnerabilities
* Underprotected APIs (NEW)

[OWASP Top 10 2017 Release Candidate](https://github.com/OWASP/Top10/raw/master/2017/OWASP%20Top%2010%20-%202017%20RC1-English.pdf)

### OWASP Top 10 comparsion table for 2013 vs 2017

| `OWASP Top 10 – 2013 (Previous)` | `OWASP Top 10 – 2017 (New)` |
| --- | --- |
| A1 - Injection | A1 - Injection |
| A2 - Broken Authentication and Session Management | A2 - Broken Authentication and Session Management |
| A3 - Cross-Site Scripting (XSS) | A3 - Cross-Site Scripting (XSS) |
| A4 - Insecure Direct Object References - Merged with A7 | A4 - Broken Access Control (Original category in 2003/2004) |
| A5 - Security Misconfiguration | A5 - Security Misconfiguration |
| A6 - Sensitive Data Exposure | A6 - Sensitive Data Exposure |
| A7 - Missing Function Level Access Control - Merged with A4 | A7 – Insufficient Attack Protection (NEW) |
| A8 – Cross-Site Request Forgery (CSRF) | A8 – Cross-Site Request Forgery (CSRF) |
| A9 – Using Components with Known Vulnerabilities | A9 – Using Components with Known Vulnerabilities |
| A10 – Unvalidated Redirects and Forwards -Dropped | A10 – UnderprotectedAPIs (NEW)Release NotesRN |


| `Threat Agents` | `Attack Vectors` | `Weakness Prevalence` | `Weakness Detectability` | `Technical Impacts` | `Business Impacts` |
| --- | --- | --- | --- | --- | --- |
| App Specific | Easy | Widespread | Easy | Severe | App/Business Specific |
| App Specific | Average | Common | Average | Moderate | App/Business Specific |
| App Specific | Difficult | Uncommon | Difficult | Minor | App/Business Specific |

## Github Repository

If you like this information then please star this repository on Github at [Software Security](https://github.com/jbelmont/software-security)