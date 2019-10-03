#FROM microsoft/dotnet:2.2-aspnetcore-runtime
#LABEL version="1.0.1" description="Aplicacao ASP .NET Core MVC"

#RUN dotnet publish --configuration Release --output dist
#COPY dist /app
#WORKDIR /app
#EXPOSE 80/tcp
#ENTRYPOINT ["dotnet","AspNetCore.dll"]


FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2
WORKDIR /app
COPY --from=build-env /app/out .
EXPOSE 80/tcp
ENTRYPOINT ["dotnet", "AspNetCore.dll"]



