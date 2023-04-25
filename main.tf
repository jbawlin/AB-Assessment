provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg" {
    location = var.location
    name = var.appservicename
}

resource "azurerm_app_service_plan" "appplan" {
    location = azurerm_resource_group.rg.location
    name = "jordan-appsserviceplan"
    resource_group_name = azurerm_resource_group.rg.name
    sku {
        size = "Standard"
        tier = "S1"
    }
}

resource "azurerm_app_service" "apservice" {
    app_service_plan_id = azurerm_app_service_plan.appplan.app_service_plan_id
    location = "azurerm_resource_group.location
    name = "jordna-appservice"
    resource_group_name = azurerm_resource_group.rg.name

    site_config {
        dotnet_framework_version = "v4.0"
        remote_debugging_enabled = true
        remote_debugging_version = "VS2019"
    }
    backup {
        name = "basicbackup"
        storage_account_url = "https://cs7100320029a8ea42f.blob.core.windows.net/?sv=2021-12-02&ss=bfqt&srt=c&sp=rwdlacupiytfx&se=2023-04-25T23:41:55Z&st=2023-04-25T15:41:55Z&spr=https&sig=%2FVnAFLHu0MdliCFIQ0zT37ggu9F%2BSDGIvKliz%2B370ug%3D"
        schedule {
            frequecy_interval = 30
            frequency_unit = "Day"
        }
    }
}