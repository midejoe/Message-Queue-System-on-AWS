# Message-Queue-System-on-AWS
This project is about building a message queue system on AWS. The services used for this project are AWS SQS and AWS Lambda.

# Definition:

Amazon SQS: Simple Queue Service was launched in 2006. It offers Async Message Based Communication as opposed to APi calls
It is scalable, Highly Available, Fully Managed and Cost Effective. It is useful in variety of contexts:
* Data Processing
* Realtime Event Processing
* Ad-hoc job queueing

AWS Lambda: Lambda is a compute service that lets you run code without provisioning or managing servers. For example, you can use Lambda to:

* Build data-processing triggers for AWS services such as Amazon Simple Storage Service (Amazon S3) and Amazon DynamoDB.

* Process streaming data stored in Amazon Kinesis.

* Create your own backend that operates at AWS scale, performance, and security.

## Use-Case:
Using message queue is a common practice for things like delivery orderings or calling centers because it preserves the ordering of messages. For example, In a telecommunication company there are customers who call in to ask questions or log in complains, although the company only have so many agents to take the phone calls. So these calls will enter into a message queue system, and you are placed on hold. The first person that calls in will be answered first, this implies the first in first out(FIFO) system.

## Common Patterns with SQS:
* For seamless processing with Backpressure Control
* Job Buffering.

## Project details:
Let's build a queue system for a book online ordering system. Imagine you have built an app that has varieties of books. So whenever customers order books online, it enters the message queue system and the bookshops will take the orders from the queue system, process the transactions and deliver your books based on the specified address.

# Execution

Step 1: Let provision the resources using Terraform.

Step 2: Create IAM Role for the Lambda Function as shown below

Step 3: Create Lambda Functions: We will create 4 Lambda functions; 1 for the application backend(Publisher) and 3 Processors(Bookstores)

Step 4: Set the configuration settings for the Lambda functions and the code

Step 4: Navigate to the application-backend and test the code

I have made a detailed article on Medium.[]

