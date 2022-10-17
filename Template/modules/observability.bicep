
param prefix string

resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${prefix}analytics'
  location: resourceGroup().location
  properties: {
    retentionInDays: 30
    sku: {
      name: 'PerGB2018'
    }
    workspaceCapping: {
      dailyQuotaGb: 10
    }
  }
}

resource appInsight 'Microsoft.Insights/components@2020-02-02' = {
  name: '${prefix}insight'
  kind: 'web'
  location: resourceGroup().location
  properties: {
    WorkspaceResourceId: logAnalytics.id
    Application_Type: 'web'
  }
}
