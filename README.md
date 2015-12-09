Server Load

This aim of this creation of this script is to determine whether a server is able to operate effectively at its current capacity taking into the account the average load placed on the server in relation to the resources configured on the server.

This works by pulling the servers current load average state over a 15 minute period and then performing a calculation against its currently allocated resources to determine if the server can handle this level of activity. This gives you a good indication as to whether the servers resources have been overutlised and provides a short listed of processes that are using the most CPU at runtime.

It provides the recommended alarm thresholds that can be assigned to alerts for monitoring agents/pollers which check the load. It also provides a list of the top 5 processes utilising CPU which is one factor that makes up the load average.

Project Workers:

Coskun Piper-Balta


Credits:

Paul Dolbear

	• Contributed to code - CPU processes
	• Ideas

Luke Shirnia

	• Contributed to code
	• Testing and identifying bugs
	• Ideas

Gus Maskowitz

	• Ideas
	• Code Structure Logic

Erik Ljungstrom

	• Testing
	• Ideas
	• Best practise for server resource data pulls


Feedback

I am open to all feedback and welcome any change requests + bug reports for improvement. 

