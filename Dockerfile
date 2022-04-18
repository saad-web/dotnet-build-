FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim
RUN mkdir /var/MerchantUserManagmentService
RUN mkdir /var/cert
COPY MerchantCSHService /var/MerchantCSHService
COPY aksa-sds-ca-certificate.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates
WORKDIR /var/MerchantCSHService
EXPOSE 5000/tcp
ENV ASPNETCORE_URLS http://*:5000
ENV TZ=Asia/Karachi
ENTRYPOINT ["dotnet", "MerchantCSHService.dll"]
