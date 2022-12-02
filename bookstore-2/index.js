exports.handler = async (event) => {
    /* log out the event body */
    console.log(JSON.stringify(event));
    
    /* extract the order details from the sqs message */
    const order = JSON.parse(event.Records[0].body);
    
    /*  log out the order */
    console.log('Received Order:', order);
    console.log('Book Shop #2 Retrieving Book from Store ....');
    
    /* wait for 5secs*/
    await sleep(5000);
};

/* define sleep function*/
function sleep(ms) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    })
}

