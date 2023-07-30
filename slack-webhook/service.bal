import ballerina/http;
// import ballerina/io;

type MsgRecord record {
 string message;
};

service http:Service / on new http:Listener(9090) {
 resource function post slacks(@http:Payload MsgRecord msgRecord) returns string|error { 
string webHook_Url = "https://hooks.slack.com/services/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";

 json slackMsg = {
 "text": msgRecord.message
 };
 
 http:Client slackClient = check new (webHook_Url);
 string|http:ClientError slackResponse = slackClient->post("", message = slackMsg, headers = {});
 // io:println(slackResponse);

 return slackResponse;
 }
}