import json

# def lambda_handler(event, context):
    # TODO implement
    # return {
    #     'statusCode': 200,
    #     'body': json.dumps('Hello from Lambda!')
    # }
    # return {
    #     "statusCode": 200,
    #     "body": "<p>Hello from Lambda! Python</p>",
    #     "headers": {
    #         'Content-Type': 'text/html',
    #         'charset': 'utf-8'
    #     }
    # }
    # return {
    #     "statusCode": 200,
    #     "headers": {
    #     'Content-Type': 'text/html; charset=utf-8'
    #     },
    #     "body": "<p>Hello world!</p>"
    # }

def lambda_handler(event, context):
    longinformation = '''
    <h1 style="color: #5e9ca0;">You can edit <span style="color: #2b2301;">this demo</span> text!</h1>
    <h2 style="color: #2e6c80;">How to send HTML with AWS lambda in Python:</h2>
    <p>Paste your documents in the visual editor on the left or your HTML code in the source editor in the right. <br />Edit any of the two areas and see the other changing in real time.&nbsp;</p>
    '''

    return {
        "statusCode": 200,
        "headers": {'Content-Type': 'text/html'},   #it really works by Hector Duran!
        "body": longinformation
    }