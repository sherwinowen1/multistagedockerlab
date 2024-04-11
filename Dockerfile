FROM mcr.microsoft.com/dotnet/sdk:8.0 As build
RUN dotnet new console -o MyApp -f net8.0
WORKDIR /MyApp
RUN dotnet run

FROM mcr.microsoft.com/dotnet/aspnet:8.0
COPY --from=build /MyApp/bin/Debug/net8.0 ./
ENTRYPOINT ["dotnet", "MyApp.dll"]