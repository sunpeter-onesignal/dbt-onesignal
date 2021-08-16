from dbt_rpc_client import DbtRpcClient
import requests

class DbtClient:
    def __init__(self, host="0.0.0.0", port=8580):
        self.rpc = DbtRpcClient(host, port)
    
    def getResponse(self, response):
        return response.text

    def getStatus(self):
        response = self.rpc.status()
        return response.ok

    def runModels(self, models):
        if models is None or len(models) == 0:
            response = self.rpc.run()
            return self.getResponse(response)
        response = self.rpc.run(models=models)
        return self.getResponse(response)

def testRun():
    models = ['sms_notifications']
    client = DbtClient()
    response = client.runModels(models)
    print(response)

testRun()

# Getting the current status of the dbt rpc server.
