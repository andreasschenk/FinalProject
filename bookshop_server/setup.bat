rd /S /Q BookShopApp
md BookShopApp
cd BookShopApp
md BookShopApp.Application
cd BookShopApp.Application
dotnet new classlib
dotnet add package MySql.EntityFrameworkCore  --version 7.*
dotnet add package Microsoft.EntityFrameworkCore.Tools --version 7.*
dotnet ef dbcontext scaffold "server=localhost;uid=root;pwd=;database=bookshop"  MySql.EntityFrameworkCore --output-dir Model --use-database-names --force --data-annotations
cd ..
md BookShopApp.Test
cd BookShopApp.Test
dotnet new mstest
dotnet add reference ..\BookShopApp.Application
cd ..
md BookShopApp.ConsoleApp
cd BookShopApp.ConsoleApp
dotnet new console
dotnet add reference ..\BookShopApp.Application
cd ..
md BookShopApp.WebApp
cd BookShopApp.WebApp
dotnet new webapi -minimal
dotnet add reference ..\BookShopApp.Application
cd ..
dotnet new sln
dotnet sln add BookShopApp.ConsoleApp
dotnet sln add BookShopApp.Application
dotnet sln add BookShopApp.Test
dotnet sln add BookShopApp.WebApp
start BookShopApp.sln
