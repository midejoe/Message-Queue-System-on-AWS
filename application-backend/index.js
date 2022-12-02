/*import the aws module*/
const AWS = require('aws-sdk');

/* set the region where your resources are located */
AWS.config.update({region: 'us-east-1'});

/*define the sqs client*/
const sqs= new AWS.SQS();

/*define the url for the sqs resource*/
const sqsURL = `https://sqs.us-east-1.amazonaws.com/240877407616/book-ordering-queue.fifo`;

/* enter the number of bookshops */
const numberOfBookShops = 3;

/* simulate the number of orders*/
const numberOfOrders = 100;

exports.handler = async (event) => {
    let orderId = 1000; /* define the variable orderId*/
    const records = []; /* define an array for the orders*/
    
    /*loop to build the parameters of the orders, in strings*/
    for (let i = 0; i < numberOfOrders; i++) {
        const params = {
            MessageBody: JSON.stringify({
                orderId: orderId,
                order: `book - ${Math.floor(Math.random() * 30)}`, /* random number from 0 to 30 */
                timestamp: new Date().toISOString()
            }),
            QueueUrl: sqsURL,
            MessageDeduplicationId: orderId.toString(),
            MessageGroupId: `group-${i % numberOfBookShops}` /* group id of the bookshops*/
        }
        records.push(params); /* add params to records */
        orderId++;
    }
    
    /* send records to sqs */
    for (const record of records) {
        await sqs.sendMessage(record).promise().then((response) => {
            console.log(JSON.stringify(response));
        }, error => {
            console.error(error); /* log out error*/
        })
    }
};
