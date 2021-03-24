Console/                                                                                            0000755 0601755 0601001 00000000000 14026661564 010747  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/ClientHandle.cs                                                                             0000644 0601755 0601001 00000000672 14026400254 013620  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Grpc.Core;

namespace Console
{
    internal abstract class ClientHandle
    {
        private readonly string _token;

        public ClientHandle(string token)
        {
            _token = token;
        }
        protected Metadata GetTokenHeader()
        {
            var headers = new Metadata();

            headers.Add("Authorization", $"Bearer {_token}");

            return headers;
        }
    }
}                                                                      Console/Console.csproj                                                                              0000644 0601755 0601001 00000000756 14026626642 013601  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
    <ProjectReference Include="..\GRPC\GRPC.csproj" />
  </ItemGroup>

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                  Console/ImageClientHandle.cs                                                                        0000644 0601755 0601001 00000002230 14026626642 014566  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ImageClientHandle : ClientHandle, IImageHandle
    {
        private readonly MyContainerImage.MyContainerImageClient _client;
        private readonly string _token;
        public ImageClientHandle(MyContainerImage.MyContainerImageClient client, string token): base(token)
        {
            _client = client;
            _token = token;
        }

        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var fileByte = Google.Protobuf.ByteString.CopyFrom(imageFile);

            var request = new BuildRequest()
            {
                Tag = tag,
                TarFile = fileByte
            };

            if (param?.Any() ?? false)
            {
                request.Params.AddRange(param);
            }

            var reply = await Task.Run(() => _client.Build(request));



            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                        Console/img.tar                                                                                     0000644 0601755 0601001 00000550000 14026647721 012232  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/                                                                                            0000755 0601755 0601001 00000000000 14026647675 010756  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/ClientHandle.cs                                                                             0000644 0601755 0601001 00000000672 14026400254 013620  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Grpc.Core;

namespace Console
{
    internal abstract class ClientHandle
    {
        private readonly string _token;

        public ClientHandle(string token)
        {
            _token = token;
        }
        protected Metadata GetTokenHeader()
        {
            var headers = new Metadata();

            headers.Add("Authorization", $"Bearer {_token}");

            return headers;
        }
    }
}                                                                      Console/Console.csproj                                                                              0000644 0601755 0601001 00000000756 14026626642 013601  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
    <ProjectReference Include="..\GRPC\GRPC.csproj" />
  </ItemGroup>

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                  Console/ImageClientHandle.cs                                                                        0000644 0601755 0601001 00000002230 14026626642 014566  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ImageClientHandle : ClientHandle, IImageHandle
    {
        private readonly MyContainerImage.MyContainerImageClient _client;
        private readonly string _token;
        public ImageClientHandle(MyContainerImage.MyContainerImageClient client, string token): base(token)
        {
            _client = client;
            _token = token;
        }

        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var fileByte = Google.Protobuf.ByteString.CopyFrom(imageFile);

            var request = new BuildRequest()
            {
                Tag = tag,
                TarFile = fileByte
            };

            if (param?.Any() ?? false)
            {
                request.Params.AddRange(param);
            }

            var reply = await Task.Run(() => _client.Build(request));



            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                        Console/img.tar                                                                                     0000644 0601755 0601001 00000264000 14026647211 012226  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/                                                                                            0000755 0601755 0601001 00000000000 14026647160 010743  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/ClientHandle.cs                                                                             0000644 0601755 0601001 00000000672 14026400254 013620  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Grpc.Core;

namespace Console
{
    internal abstract class ClientHandle
    {
        private readonly string _token;

        public ClientHandle(string token)
        {
            _token = token;
        }
        protected Metadata GetTokenHeader()
        {
            var headers = new Metadata();

            headers.Add("Authorization", $"Bearer {_token}");

            return headers;
        }
    }
}                                                                      Console/Console.csproj                                                                              0000644 0601755 0601001 00000000756 14026626642 013601  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
    <ProjectReference Include="..\GRPC\GRPC.csproj" />
  </ItemGroup>

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                  Console/ImageClientHandle.cs                                                                        0000644 0601755 0601001 00000002230 14026626642 014566  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ImageClientHandle : ClientHandle, IImageHandle
    {
        private readonly MyContainerImage.MyContainerImageClient _client;
        private readonly string _token;
        public ImageClientHandle(MyContainerImage.MyContainerImageClient client, string token): base(token)
        {
            _client = client;
            _token = token;
        }

        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var fileByte = Google.Protobuf.ByteString.CopyFrom(imageFile);

            var request = new BuildRequest()
            {
                Tag = tag,
                TarFile = fileByte
            };

            if (param?.Any() ?? false)
            {
                request.Params.AddRange(param);
            }

            var reply = await Task.Run(() => _client.Build(request));



            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                        Console/Program.cs                                                                                  0000644 0601755 0601001 00000016175 14026640566 012716  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using Endpoint;
using Core.DTO;
using Grpc.Net.Client;
using System;
using System.Net.Http;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using Mono.Options;
using Grpc.Core;
using GRPC;
using Core;

namespace Console
{
    public enum Actions
    {
        Create,
        Update,
        Remove,
        List,
        Build,
        Non
    }
    class Program
    {
        private static string url = "https://localhost:5001";
        private static string file = string.Empty;
        private static Actions action = Actions.Non;
        private static string token = string.Empty;
        private static string tag = "latest";
        private static IList<string> buildParam = new List<string>();
        private static IServiceHandle _serviceHandle;
        private static IImageHandle _imageHandle;

        static void Main(string[] args)
        {

            try
            {
                ParserArgs(args);

                switch(action)
                {
                    case Actions.Create:
                        Create();
                        break;
                    case Actions.Remove:
                        Remove();
                        break;
                    case Actions.Update:
                        Update();
                        break;
                    case Actions.Build:
                        BuildImage();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException("Invalid action informed.");
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e.Message);
            }

        }
        private static void BuildImage()
        {
            if (!File.Exists(file))
            {
                throw new FileNotFoundException();
            }
            
            _imageHandle = new ImageClientHandle(GetImageClient(url), token);

            var fileBytes = File.ReadAllBytes(file);

            var reply = _imageHandle.BuildImage(fileBytes, buildParam, tag).Result;

            System.Console.WriteLine(reply);

        }
        private static void Update()
        {   
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

           var reply = _serviceHandle.UpdateService(service).Result;

            System.Console.WriteLine(reply);
        }

        private static void Remove()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var reply = _serviceHandle.RemoveService(service.Id ?? service.Name).Result;

            System.Console.WriteLine(reply);
        }

        private static void Create()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var response = _serviceHandle.CreateService(service, true).Result;

            System.Console.WriteLine(response);
        }

        private static void ParserArgs(IEnumerable<string> args)
        {
            var showHelp = false;
            var writeJson = false;
            var opt = new OptionSet()
            {
                {"u|url=", "The url of grpc endpoints", u => url = u },
                {"f|file=", "The json of service or tar of image to be handled", j => file = j},
                {"t|tag=", "The image tag to build. If not passed, latest be default.", t => tag = t },
                {"p|param=", "The param to build. Ex: foo=bar", p => buildParam.Add(p) },
                {"a|action=", "The action to perform (create,update,remove)", a => action = (Actions)Enum.Parse(typeof(Actions), a)},
                {"w|write", "Write json example", w => writeJson = w != null},
                {"h|help", "Print help", h => showHelp = h != null}
            };

            try
            {
                opt.Parse(args);
            }
            catch (OptionException e)
            {
                System.Console.WriteLine (e.Message);
                System.Console.WriteLine ("Try `Console --help' for more information.");
                return;
            }

            if (showHelp)
            {
                ShowHelp(opt);
                Environment.Exit(0);
            }

            if (writeJson)
            {
                PrintJsonExample();
                Environment.Exit(0);       
            }

            if (string.IsNullOrEmpty(file))
            {
                System.Console.WriteLine("File path must be passed with -f or --f");
                Environment.Exit(1);
            }
            
        }
        private static void ShowHelp(OptionSet opt)
        {
            System.Console.WriteLine("Usage: Console ...");
            System.Console.WriteLine("Interact com MyContainerService");
            System.Console.WriteLine();
            System.Console.WriteLine("Options:");
            opt.WriteOptionDescriptions (System.Console.Out);
        }

        private static void PrintJsonExample()
        {
            var service = new MyService("test", "redis", "backend", "db_net")
            {
                Id = Guid.NewGuid().ToString(),
                Labels = new Dictionary<string, string>()
                {
                    {"createdByMyService", "true"}
                },
                Volumes = new List<Core.DTO.Volume>()
                {
                    new Core.DTO.Volume(false, "/tmp/data", "/app")
                },
                Ports = new List<Core.DTO.Port>()
                {
                    new Core.DTO.Port(80, "tcp")
                }
            };

            System.Console.WriteLine(JsonConvert.SerializeObject(service));
        }

        private static MyContainerService.MyContainerServiceClient GetServiceClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerService.MyContainerServiceClient(channel);
            return client;
        }

        private static GrpcChannel CreateChannel(string url)
        {
            var httpHandler = new HttpClientHandler();
            httpHandler.ServerCertificateCustomValidationCallback =
            HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;

            var channel = GrpcChannel.ForAddress(url,
            new GrpcChannelOptions { HttpHandler = httpHandler });
            return channel;
        }

        private static MyContainerImage.MyContainerImageClient GetImageClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerImage.MyContainerImageClient(channel);
            return client;
        }

        private static MyService ReadMyServiceJson(string jsonPath)
        {
            var json = File.ReadAllText(jsonPath);

            return JsonConvert.DeserializeObject<MyService>(json);
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                   Console/ServiceClientHandle.cs                                                                      0000644 0601755 0601001 00000003065 14026400242 015135  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ServiceClientHandle : ClientHandle, IServiceHandle
    {
        private readonly MyContainerService.MyContainerServiceClient _client;
        
        public ServiceClientHandle(MyContainerService.MyContainerServiceClient client, string token): base(token)
        {
            _client = client;
        }
        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var reply = await Task.Run(() =>  _client.Create(new CreateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }

        public Task<IEnumerable<MyService>> GetServices()
        {
            throw new System.NotImplementedException();
        }

        public async Task<string> RemoveService(string serviceId)
        {
             var reply = await Task.Run (() => _client.Remove(new RemoveRequest() {
                ServiceNameOrId = serviceId
            }, GetTokenHeader()));

            return reply.Message;
        }

        public async Task<string> UpdateService(MyService service)
        {
            var reply = await Task.Run(() => _client.Update(new UpdateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Console/Services/                                                                                   0000755 0601755 0601001 00000000000 14026347461 012527  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/Services/docker-compose.yml                                                                 0000644 0601755 0601001 00000000071 14026347461 016162  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                version: "3.7"
services:

  redis:
    image: redis
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Console/Services/myService.json                                                                     0000644 0601755 0601001 00000000717 14026643560 015374  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
    "Name": "mcs_MCS",
    "Image": "mcs:latest",
    "Networks": [
      "mcs_default"
    ],
    "Labels": {
      "createdByMyService": "true"
    },
    "Volumes": [
      {
        "ReadOnly": true,
        "Source": "/var/run/docker.sock",
        "Target": "/var/run/docker.sock"
      }
    ],
    "Ports": [
        {
          "InternalPort": 5000,
          "ExternalPort": 80,
          "Protocol": "tcp"
        }
      ]
  }                                                 Core/                                                                                               0000755 0601755 0601001 00000000000 14026647134 010232  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/Core.csproj                                                                                    0000644 0601755 0601001 00000000475 14026626642 012353  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   Core/DTO/                                                                                           0000755 0601755 0601001 00000000000 14026347461 010660  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/DTO/MyService.cs                                                                               0000644 0601755 0601001 00000007524 14026347461 013125  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;

namespace Core.DTO
{
    public class MyService
    {
        public MyService(string name, string image)
        {
            Name = name;
            Image = image;
        }

        public MyService(string name, string image, params string[] networks) : this(name, image)
        {
            Networks = networks?.ToList();
        }

        public MyService(string name, string image, IList<Volume> volumes) : this(name, image)
        {
            Volumes = volumes;
        }

        public MyService(string name, string image, IList<Volume> volumes, params string[] networks): this(name, image, volumes)
        {
            Networks = networks.ToList();
        }

        public MyService(string name, string image, TraefikConfig traefikConfig) : this(name, image)
        {
            AddTraefikLabels(traefikConfig);
        }

        public MyService()
        {
            
        }

        public string Id { get; set; }
        public string Name { get; init; }
        public string Image { get; init; }
        public int Version { get; set; }
        public IEnumerable<string> Networks { get; init; }
        public IDictionary<string, string> Labels { get; set; }
        public IEnumerable<Volume> Volumes { get; set; }
        public IEnumerable<Port> Ports { get; set; }

        private void AddTraefikLabels(TraefikConfig config)
        {
            if (Labels is null)
            {
                Labels = new Dictionary<string, string>()
                {
                    {"traefik.enable", "true"},
                    {$"traefik.http.services.{Name}.loadbalancer.server.port", config.InternalPort.ToString()},
                    {$"traefik.http.routers.{Name}.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}.entrypoints", config.HttpEntrypoint},
                    {$"traefik.http.middlewares.{Name}.redirectscheme.scheme", "https"},
                    {$"traefik.http.routers.{Name}.middlewares", Name},
                    {$"traefik.http.routers.{Name}-secured.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}-secured.entrypoints", config.HttpsEntrypoint},
                    {$"traefik.http.routers.{Name}-secured.tls", "true"},
                    {$"traefik.http.routers.{Name}-secured.tls.certresolver", config.CertResolver},
                    {$"traefik.docker.network", config.Network}
                };
            }
        }

    }

    public class Volume
    {
        public Volume(bool readOnly, string source, string target)
        {
            ReadOnly = readOnly;
            Source = source;
            Target = target;
        }

        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
    }

    public class Port
    {
        public Port(int internalPort, int externalPort, string protocol)
        {
            InternalPort = internalPort;
            ExternalPort = externalPort;
            Protocol = protocol;
        }

        
        public Port(int internalPort, string protocol)
        {
            InternalPort = internalPort;
            Protocol = protocol;
        }

        public Port()
        {
            
        }

        public int InternalPort { get; set; }
        public int? ExternalPort { get; set; }
        public string Protocol { get; set; }
    }

    public class TraefikConfig
    {
        public string Domain { get; init; }
        public int InternalPort { get; init; }
        public string HttpEntrypoint { get; init; }
        public string HttpsEntrypoint { get; init; }
        public string CertResolver { get; init; }
        public string Network { get; init; }
    }
}                                                                                                                                                                            Core/IImageHandle.cs                                                                                0000644 0601755 0601001 00000000366 14026626642 013036  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Core
{
    public interface IImageHandle
    {
        Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag);
    }
}                                                                                                                                                                                                                                                                          Core/IServiceHandle.cs                                                                              0000644 0601755 0601001 00000000625 14026370541 013404  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                
using System.Collections.Generic;
using System.Threading.Tasks;
using Core.DTO;

namespace Core
{
    public interface IServiceHandle
    {
        Task<string> CreateService(MyService service, bool ensureNetworks);
        Task<string> UpdateService(MyService service);
        Task<string> RemoveService(string serviceId);
        Task<IEnumerable<MyService>> GetServices();
    }
    
}                                                                                                           DI/                                                                                                 0000755 0601755 0601001 00000000000 14026647134 007636  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                DI/DependencyInjection.cs                                                                           0000644 0601755 0601001 00000002560 14026417663 014113  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System;
using HttpSocket;
using System.Net.Http;
using Docker;

namespace DI
{
    public static class DependencyInjection
    {
        public static void AddServiceHandle(this IServiceCollection services)
        {
            services.AddScoped<HttpClient>(x => UnixHttpClient.CreateHttpClient("/var/run/docker.sock"));
            services.AddScoped<IServiceHandle, DockerServiceHandle>();
            services.AddScoped<IImageHandle, DockerImageHandle>();
        }

        public static void AddTokenParser(this IServiceCollection services)
        {
            services.AddAuthentication()
                    .AddCookie(options => {
                        options.LoginPath = "/Account/Unauthorized/";
                        options.AccessDeniedPath = "/Account/Forbidden/";
                    })
                    .AddJwtBearer(options => {
                        options.Audience = "http://localhost:5001/";
                        options.Authority = "http://localhost:5000/";
                        options.RequireHttpsMetadata = false;
                        options.Validate("test");
                    });

            services.AddAuthorization();
        }

    }
}                                                                                                                                                DI/DI.csproj                                                                                        0000644 0601755 0601001 00000001504 14026626642 011355  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\Docker\Docker.csproj"/>
    <ProjectReference Include="..\HttpSocket\HttpSocket.csproj"/>
  </ItemGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.Extensions.DependencyInjection" Version="5.0.1"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication" Version="2.2.0"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                            Docker/                                                                                             0000755 0601755 0601001 00000000000 14026647134 010551  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Docker/Docker.csproj                                                                                0000644 0601755 0601001 00000000770 14026626642 013207  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
  </ItemGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>        Docker/DockerImageHandle.cs                                                                         0000644 0601755 0601001 00000003267 14026626642 014377  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Core;

namespace Docker
{
    public class DockerImageHandle : IImageHandle
    {
        private const string BUILD_URI = "/v1.24/build";
        private readonly HttpClient _httpClient;
        public DockerImageHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var buildArgs = GetBuildArgs(param);
            var query = HttpUtility.ParseQueryString(string.Empty);
            query.Add("t", tag);
            query.Add("q", "true");
            query.Add("buildargs", buildArgs);

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{BUILD_URI}?{query.ToString()}");

            var tarAsString = Encoding.UTF8.GetString(imageFile);

            requestMessage.Content = new StringContent(tarAsString, Encoding.UTF8, "application/x-tar");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private static string GetBuildArgs(IEnumerable<string> param)
        {
            var p = param.Select(x =>
            {
                var p = x.Split('=');
                return $"\"{p.FirstOrDefault()}\":\"{p.LastOrDefault()}\"";
            });

            var args = "{";
            args += $"{string.Join(',', p)}";
            args += "}";

            return args;
        }
    }
}                                                                                                                                                                                                                                                                                                                                         Docker/DockerService.cs                                                                             0000644 0601755 0601001 00000006552 14026645446 013644  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using System.Linq;
using System;

namespace Docker
{
   // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 

    public class DriverConfig
    {
    }

    public class Labels
    {
        [JsonProperty("com.example.something")]
        public string ComExampleSomething { get; set; }
        public string foo { get; set; }
    }

    public class VolumeOptions
    {
        public DriverConfig DriverConfig { get; set; }
        public Labels Labels { get; set; }
    }

    public class Mount
    {
        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
        public string Type { get; set; }
        public VolumeOptions VolumeOptions { get; set; }
    }

    public class ContainerSpec
    {
        public string Image { get; set; }
        public List<Mount> Mounts { get; set; }
        public string User { get; set; }
    }

    public class Network
    {
        public string Target { get; set; }
    }

    public class Options
    {
        [JsonProperty("max-file")]
        public string MaxFile { get; set; }

        [JsonProperty("max-size")]
        public string MaxSize { get; set; }
    }

    public class LogDriver
    {
        public string Name { get; set; }
        public Options Options { get; set; }
    }

    public class Placement
    {
        public List<string> Constraints { get; set; }
    }

    public class Limits
    {
        public int MemoryBytes { get; set; }
    }

    public class Reservations
    {
    }

    public class Resources
    {
        public Limits Limits { get; set; }
        public Reservations Reservations { get; set; }
    }

    public class RestartPolicy
    {
        public string Condition { get; set; }
        public long Delay { get; set; }
        public int MaxAttempts { get; set; }
    }

    public class TaskTemplate
    {
        public ContainerSpec ContainerSpec { get; set; }
        public List<Network> Networks { get; set; }
        public LogDriver LogDriver { get; set; }
        public Placement Placement { get; set; }
        public Resources Resources { get; set; }
        public RestartPolicy RestartPolicy { get; set; }
    }

    public class Replicated
    {
        public int Replicas { get; set; }
    }

    public class Mode
    {
        public Replicated Replicated { get; set; }
    }

    public class UpdateConfig
    {
        public long Delay { get; set; }
        public int Parallelism { get; set; }
        public string FailureAction { get; set; }
    }

    public class Port
    {
        public string Protocol { get; set; }
        public int PublishedPort { get; set; }
        public int TargetPort { get; set; }
    }

    public class EndpointSpec
    {
        public List<Port> Ports { get; set; }
    }

    public class DockerService
    {
        public string Name { get; set; }
        public TaskTemplate TaskTemplate { get; set; }
        public Mode Mode { get; set; }
        public UpdateConfig UpdateConfig { get; set; }
        public EndpointSpec EndpointSpec { get; set; }
        public IDictionary<string, string> Labels { get; set; }
    }


}                                                                                                                                                      Docker/DockerServiceHandle.cs                                                                       0000644 0601755 0601001 00000006646 14026647044 014760  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Newtonsoft.Json;
using System.IO;
using System;

namespace Docker
{
    public class DockerServiceHandle : IServiceHandle
    {
        private const string CREATE_URI = "/v1.24/services/create";
        private const string GET_URI = "/v1.24/services";
        private const string NETWORK_URI = "/v1.24/networks";
        private const string MEDIA_TYPE = "application/json";
        private readonly HttpClient _httpClient;
        
        public DockerServiceHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var dockerService = service.GetDockerService().AsJson();

            if (ensureNetworks)
            {
                EnsureNetworks(service.Networks);
            }
            
            var requestMessage = new HttpRequestMessage(HttpMethod.Post, CREATE_URI);

            requestMessage.Content = new StringContent(dockerService, Encoding.UTF8, MEDIA_TYPE);

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private void EnsureNetworks(IEnumerable<string> networks)
        {
            
        }

        public async Task<IEnumerable<MyService>> GetServices()
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, GET_URI);

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var dockerServices = body.FromJson<IList<DockerServiceResponse>>();
            
            return dockerServices.GetMyServices();
        }

        public async Task<string> RemoveService(string serviceId)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Delete, $"{GET_URI}/{serviceId}");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();
        }

        public async Task<string> UpdateService(MyService service)
        {
            var id = !string.IsNullOrEmpty(service.Id) ? service.Id : service.Name;

            var newVersion = await GetLastServiceVersion(id) + 1;

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{GET_URI}/{id}/update?version={newVersion}");

            var serviceDocker = service.GetDockerService().AsJson();

            requestMessage.Content = new StringContent(serviceDocker, Encoding.UTF8, MEDIA_TYPE);           

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync() + serviceDocker;
        }

        private async Task<int> GetLastServiceVersion(string id)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, $"{GET_URI}/{id}");

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var service = body.FromJson<DockerServiceResponse>();

            return service.Version;
        }
    }
}
                                                                                          Docker/DockerServiceResponse.cs                                                                     0000644 0601755 0601001 00000001537 14026645411 015351  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

namespace Docker
{
    public class DockerServiceResponse    
    {
        public DockerService Spec { get; set; }
        public string ID { get; set; }
        [JsonProperty("Version.Index")]
        public int Version {get; set;}
        public string Image => Spec.TaskTemplate.ContainerSpec.Image;
        public string Name => Spec.Name;
        [JsonIgnore]
        public IEnumerable<string> Networks => Spec.TaskTemplate.Networks?.Select(x => x.Target);
        [JsonIgnore]
        public IDictionary<string, string> Labels => Spec.Labels;
        [JsonIgnore]
        public IEnumerable<Mount> Mounts => Spec.TaskTemplate.ContainerSpec.Mounts;
        [JsonIgnore]
        public IEnumerable<Port> Ports => Spec.EndpointSpec.Ports;
        

    }
}                                                                                                                                                                 Docker/Extensions.cs                                                                                0000644 0601755 0601001 00000005730 14026646744 013252  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using Core.DTO;
using Newtonsoft.Json;

namespace Docker
{
    public static class Extensions
    {
        public static DockerServiceResponse GetDockerService(this MyService myService)
        {
            return new DockerServiceResponse()
            {
                ID = myService.Id,
                Version = myService.Version,
                Spec = new DockerService()
                    {
                        Name = myService.Name,
                        Labels = myService.Labels,
                        TaskTemplate = new TaskTemplate()
                        {
                            ContainerSpec = new ContainerSpec()
                            {
                                Image = myService.Image,
                                Mounts = myService.Volumes?.Select(x => new Mount()
                                {
                                    ReadOnly = x.ReadOnly,
                                    Source = x?.Source,
                                    Target = x.Target
                                })?.ToList()
                            },
                            Networks = myService.Networks?.Select(x => new Network()
                            {
                                Target = x
                            
                            })?.ToList()
                        },
                        EndpointSpec = new EndpointSpec()
                        {
                            Ports = myService.Ports.Select(x => new Port()
                            {
                                Protocol = x.Protocol,
                                PublishedPort = x.ExternalPort ?? 0,
                                TargetPort = x.InternalPort
                            }).ToList()
                        }
                    }
            };
            
        }

        public static MyService GetMyService(this DockerServiceResponse service)
        {
           return new MyService(service.Name, service.Image, service.Networks?.ToArray())
           {
                Id = service.ID,
                Labels = service.Labels,
                Version = service.Version,
                Volumes = service.Mounts?.Select(x => new Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Ports?.Select(x => new Core.DTO.Port(x.TargetPort, x.PublishedPort, x.Protocol))
           };
        }

        public static IEnumerable<MyService> GetMyServices(this IEnumerable<DockerServiceResponse> containers)
        {
            return containers.Select(x => x.GetMyService());
        }

        public static T FromJson<T>(this string obj)
        {
            return JsonConvert.DeserializeObject<T>(obj);
        }

        public static string AsJson<T>(this T obj)
        {

            return JsonConvert.SerializeObject(obj);
        }

    }
}                                        Dockerfile                                                                                          0000644 0601755 0601001 00000000553 14026347461 011337  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                FROM mcr.microsoft.com/dotnet/sdk AS build
WORKDIR /src
COPY ./ ./
RUN dotnet restore Endpoint/Endpoint.csproj && dotnet publish Endpoint/Endpoint.csproj -c Release -o publish


FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /src/publish ./
EXPOSE 80
VOLUME /var/run/docker.sock
ENTRYPOINT ["dotnet", "Endpoint.dll"]                                                                                                                                                     Endpoint/                                                                                           0000755 0601755 0601001 00000000000 14026647134 011122  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/appsettings.Development.json                                                               0000644 0601755 0601001 00000000260 14026175111 016624  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "System": "Information",
      "Grpc": "Information",
      "Microsoft": "Information"
    }
  }
}
                                                                                                                                                                                                                                                                                                                                                Endpoint/appsettings.json                                                                           0000644 0601755 0601001 00000000407 14026175111 014346  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "Kestrel": {
    "EndpointDefaults": {
      "Protocols": "Http2"
    }
  }
}
                                                                                                                                                                                                                                                         Endpoint/Endpoint.csproj                                                                            0000644 0601755 0601001 00000001177 14026626642 014133  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk.Web">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\DI\DI.csproj"/>
    <ProjectReference Include="..\GRPC\GRPC.csproj"/>
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                                                                                                                                                                                                                                 Endpoint/Program.cs                                                                                 0000644 0601755 0601001 00000001554 14026175111 013054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        // Additional configuration is required to successfully run gRPC on macOS.
        // For instructions on how to configure Kestrel and gRPC clients on macOS, visit https://go.microsoft.com/fwlink/?linkid=2099682
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
                                                                                                                                                    Endpoint/Properties/                                                                                0000755 0601755 0601001 00000000000 14026175111 013245  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Properties/launchSettings.json                                                             0000644 0601755 0601001 00000000501 14026175111 017127  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿{
  "profiles": {
    "Endpoint": {
      "commandName": "Project",
      "dotnetRunMessages": "true",
      "launchBrowser": false,
      "applicationUrl": "http://localhost:5000;https://localhost:5001",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
                                                                                                                                                                                               Endpoint/Services/                                                                                  0000755 0601755 0601001 00000000000 14026626642 012706  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Services/MyContainerImageImpl.cs                                                           0000644 0601755 0601001 00000002333 14026626642 017253  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Google.Protobuf;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerImageImpl : MyContainerImage.MyContainerImageBase
    {
        private readonly IImageHandle _handle;
        private readonly ILogger<MyContainerImageImpl> _logger;
        public MyContainerImageImpl(ILogger<MyContainerImageImpl> logger, IImageHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<BuildReply> Build(BuildRequest request, ServerCallContext context)
        {
            var data = request.TarFile.ToByteArray();
            
            var tag = request.Tag;
            var param = request.Params.Select(x => x);
            var response = await _handle.BuildImage(data, param, tag);

            return new BuildReply()
            {
                Message = response
            };
        }
    }
}
                                                                                                                                                                                                                                                                                                     Endpoint/Services/MyContainerServiceImpl.cs                                                         0000644 0601755 0601001 00000003554 14026370657 017641  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Threading.Tasks;
using Core;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerServiceImpl : MyContainerService.MyContainerServiceBase
    {
        private readonly IServiceHandle _handle;
        private readonly ILogger<MyContainerServiceImpl> _logger;
        public MyContainerServiceImpl(ILogger<MyContainerServiceImpl> logger, IServiceHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<CreateReply> Create(CreateRequest request, ServerCallContext context)
        {
            var msg = await _handle.CreateService(request.Service.FromGrpcService(), true);
            return new CreateReply()
            {
                Message = msg
            };
        }

        public override async Task<GetReply> Get(GetRequest request, ServerCallContext context)
        {
            var reply = new GetReply();

            reply.Services.AddRange((await _handle.GetServices()).ToGrpcService());

            return reply;
        }

        public override async Task<RemoveReply> Remove(RemoveRequest request, ServerCallContext context)
        {
            return new RemoveReply()
            {
                Message = await _handle.RemoveService(request.ServiceNameOrId)
            };
        }

        public override async Task<UpdateReply> Update(UpdateRequest request, ServerCallContext context)
        {
            return new UpdateReply()
            {
                Message = await _handle.UpdateService(request.Service.FromGrpcService())
            };
        }
    }
}
                                                                                                                                                    Endpoint/Startup.cs                                                                                 0000644 0601755 0601001 00000002323 14026417663 013115  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using DI;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Startup
    {
        
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc();
            services.AddServiceHandle();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<MyContainerServiceImpl>();
                endpoints.MapGrpcService<MyContainerImageImpl>();

                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");
                });
            });
        }
    }
}
                                                                                                                                                                                                                                                                                                             GRPC/                                                                                               0000755 0601755 0601001 00000000000 14026647134 010075  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                GRPC/GRPC.csproj                                                                                    0000644 0601755 0601001 00000002333 14026626642 012054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
<ItemGroup>
    <Protobuf Include="..\Protos\myContainerService.proto" GrpcServices="Server,Client" />
    <Protobuf Include="..\Protos\myContainerImage.proto" GrpcServices="Server,Client" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.Core" Version="2.36.1" />
    <PackageReference Include="Grpc.Net.Client" Version="2.36.0" />
    <PackageReference Include="Grpc.Tools" Version="2.36.0" />
    <PackageReference Include="Google.Protobuf" Version="3.15.6" />
    <PackageReference Include="Grpc.Net.ClientFactory" Version="2.36.0" />
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
    <PackageReference Include="Mono.Options" Version="6.6.0.161" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.AspNetCore" Version="2.34.0" />
  </ItemGroup>

   <ItemGroup>
     <ProjectReference Include="..\Core\Core.csproj" />
   </ItemGroup>
   
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>

</Project>
                                                                                                                                                                                                                                                                                                     GRPC/GrpcServiceConversion.cs                                                                       0000644 0601755 0601001 00000005136 14026640563 014712  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Core.DTO;
using Endpoint;

namespace GRPC
{
    public static class GrpcServiceConversion
    {
        public static IEnumerable<MyService> FromGrpcService(this IEnumerable<Service> services)
        {
            return services.Select(x => x.FromGrpcService());
        }

        public static IEnumerable<Service> ToGrpcService(this IEnumerable<MyService> services)
        {
            return services.Select(x => x.ToGrpcService());
        }
        public static MyService FromGrpcService(this Service service)
        {
            return new MyService(service.Name, service.Image)
            {
                Id = service.Id,
                Version = service.Version,
                Labels = service.Labels.ToDictionary(x => x.Key, y => y.Value),
                Networks = service.Networks,
                Volumes = service.Volume?.Select(x => new Core.DTO.Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Port?.Select(x => new Core.DTO.Port(x.Target, x.Publish, x.Protocol))
            };
        }
        public static Service ToGrpcService(this MyService service)
        {
            var serviceGrpc = new Service
            {
                Id = service.Id ?? string.Empty,
                Name = service.Name,
                Image = service.Image,
                Version = service.Version
            };

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Labels.AddRange(service.Labels.Select(x => new Label()
                {
                    Key = x.Key,
                    Value = x.Value
                }));
            }

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Volume.AddRange(service.Volumes?.Select(x => new Endpoint.Volume()
                {
                    ReadOnly = x.ReadOnly,
                    Source = x.Source,
                    Target = x.Target
                }));
            }
            
            if (service.Networks?.Any() ?? false)
            {
                serviceGrpc.Networks.AddRange(service.Networks);
            }
            
            if (service.Ports?.Any() ?? false)
            {
                serviceGrpc.Port.AddRange(service.Ports?.Select(x => new Endpoint.Port()
                {
                    Protocol = x.Protocol,
                    Publish = x.ExternalPort ?? 0,
                    Target = x.InternalPort
                }));
            }

            return serviceGrpc;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                  HttpSocket/                                                                                         0000755 0601755 0601001 00000000000 14026647134 011432  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                HttpSocket/HttpSocket.csproj                                                                        0000644 0601755 0601001 00000000475 14026626642 014753  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   HttpSocket/UnixHttpClient.cs                                                                        0000644 0601755 0601001 00000002150 14026175111 014670  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Net.Http;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;

namespace HttpSocket 
{
    public class UnixHttpClient
    {
        private static UnixDomainSocketEndPoint _endPoint;

        private static async ValueTask<Stream> SocketConnectionAsync(SocketsHttpConnectionContext socketsHttpConnectionContext, CancellationToken cancellationToken)
        {
            var socket = new Socket(AddressFamily.Unix, SocketType.Stream, ProtocolType.IP);
            
            await socket.ConnectAsync(_endPoint);
            
            return  new NetworkStream(socket);;
        }

        public static HttpClient CreateHttpClient(string unixSockPath)
        {
            var con = new SocketsHttpHandler();

            con.ConnectCallback = SocketConnectionAsync;
            
            var httpClient = new HttpClient(con);

            httpClient.BaseAddress = new System.Uri("http://hub.docker.io");

            _endPoint = new UnixDomainSocketEndPoint(unixSockPath);

            return httpClient;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                        MyContainerService.sln                                                                              0000644 0601755 0601001 00000020244 14026347461 013633  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 16
VisualStudioVersion = 16.6.30114.105
MinimumVisualStudioVersion = 10.0.40219.1
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Core", "Core\Core.csproj", "{2F123D68-1A07-4292-ACB0-C1DE7630BF07}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Docker", "Docker\Docker.csproj", "{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Endpoint", "Endpoint\Endpoint.csproj", "{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "DI", "DI\DI.csproj", "{59D12BD5-00EA-45A2-8991-379E2A955483}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "GRPC", "GRPC\GRPC.csproj", "{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "HttpSocket", "HttpSocket\HttpSocket.csproj", "{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Console", "Console\Console.csproj", "{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Debug|x64 = Debug|x64
		Debug|x86 = Debug|x86
		Release|Any CPU = Release|Any CPU
		Release|x64 = Release|x64
		Release|x86 = Release|x86
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.Build.0 = Release|Any CPU
	EndGlobalSection
EndGlobal
                                                                                                                                                                                                                                                                                                                                                            Protos/                                                                                             0000755 0601755 0601001 00000000000 14026626642 010631  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Protos/myContainerImage.proto                                                                       0000644 0601755 0601001 00000000511 14026626642 015146  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerimage;

service MyContainerImage {
  rpc Build (BuildRequest) returns (BuildReply);
 
}

message BuildRequest {
  bytes tarFile = 1;
  string tag = 2;
  repeated string params = 3;
}

message BuildReply {
  string message = 1;
}

                                                                                                                                                                                       Protos/myContainerService.proto                                                                     0000644 0601755 0601001 00000002272 14026642764 015535  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerservice;

service MyContainerService {
  rpc Create (CreateRequest) returns (CreateReply);
  rpc Update (UpdateRequest) returns (UpdateReply);
  rpc Remove (RemoveRequest) returns (RemoveReply);
  rpc Get (GetRequest) returns (GetReply);
}

message CreateRequest {
  Service service =1;
}

message UpdateRequest {
  Service service = 1;
}

message RemoveRequest {
  string serviceNameOrId = 1;
}

message GetRequest {
}

message CreateReply {
  string message = 1;
}

message UpdateReply {
  string message = 1;
}

message RemoveReply {
  string message = 1;
}

message GetReply {
  repeated Service services = 1;
}

message Service {
  string id = 1;
  string name = 2;
  string image = 3;

  repeated string networks = 4;
  repeated Label labels = 5;
  repeated Volume volume = 6;
  repeated Port port = 7;
  int32 version = 8;
}

message Label {
  string key = 1;
  string value = 2;
}

message Volume {
  string source = 1;
  string target = 2;
  bool readOnly = 3;
}

message Port {
  int32 target = 1;
  int32 publish = 2;
  string protocol = 3;
}



                                                                                                                                                                                                                                                                                                                                      README.md                                                                                           0000644 0601755 0601001 00000001000 14026417663 010612  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                # MyContainerService
This is an simple abstraction of Docker (For now) Services API to easily and safely manage services from anywhere.

:warning: Be very careful with production use. **Credentials not implemented yet**.

# ToDo
- [ ] Tests, tests, tests and more tests.
- [x] GRPC Endpoint.
- [x] CLI that recives MyService json to pass on Endpoint.
- [ ] Load docker-compose.yaml.
- [ ] GRPC Authentication.
- [ ] Integrate with Kubernetes.
- [ ] UI prefered in VueJS.
- [ ] Increment this ToDo.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Console/Program.cs                                                                                  0000644 0601755 0601001 00000016175 14026640566 012716  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using Endpoint;
using Core.DTO;
using Grpc.Net.Client;
using System;
using System.Net.Http;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using Mono.Options;
using Grpc.Core;
using GRPC;
using Core;

namespace Console
{
    public enum Actions
    {
        Create,
        Update,
        Remove,
        List,
        Build,
        Non
    }
    class Program
    {
        private static string url = "https://localhost:5001";
        private static string file = string.Empty;
        private static Actions action = Actions.Non;
        private static string token = string.Empty;
        private static string tag = "latest";
        private static IList<string> buildParam = new List<string>();
        private static IServiceHandle _serviceHandle;
        private static IImageHandle _imageHandle;

        static void Main(string[] args)
        {

            try
            {
                ParserArgs(args);

                switch(action)
                {
                    case Actions.Create:
                        Create();
                        break;
                    case Actions.Remove:
                        Remove();
                        break;
                    case Actions.Update:
                        Update();
                        break;
                    case Actions.Build:
                        BuildImage();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException("Invalid action informed.");
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e.Message);
            }

        }
        private static void BuildImage()
        {
            if (!File.Exists(file))
            {
                throw new FileNotFoundException();
            }
            
            _imageHandle = new ImageClientHandle(GetImageClient(url), token);

            var fileBytes = File.ReadAllBytes(file);

            var reply = _imageHandle.BuildImage(fileBytes, buildParam, tag).Result;

            System.Console.WriteLine(reply);

        }
        private static void Update()
        {   
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

           var reply = _serviceHandle.UpdateService(service).Result;

            System.Console.WriteLine(reply);
        }

        private static void Remove()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var reply = _serviceHandle.RemoveService(service.Id ?? service.Name).Result;

            System.Console.WriteLine(reply);
        }

        private static void Create()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var response = _serviceHandle.CreateService(service, true).Result;

            System.Console.WriteLine(response);
        }

        private static void ParserArgs(IEnumerable<string> args)
        {
            var showHelp = false;
            var writeJson = false;
            var opt = new OptionSet()
            {
                {"u|url=", "The url of grpc endpoints", u => url = u },
                {"f|file=", "The json of service or tar of image to be handled", j => file = j},
                {"t|tag=", "The image tag to build. If not passed, latest be default.", t => tag = t },
                {"p|param=", "The param to build. Ex: foo=bar", p => buildParam.Add(p) },
                {"a|action=", "The action to perform (create,update,remove)", a => action = (Actions)Enum.Parse(typeof(Actions), a)},
                {"w|write", "Write json example", w => writeJson = w != null},
                {"h|help", "Print help", h => showHelp = h != null}
            };

            try
            {
                opt.Parse(args);
            }
            catch (OptionException e)
            {
                System.Console.WriteLine (e.Message);
                System.Console.WriteLine ("Try `Console --help' for more information.");
                return;
            }

            if (showHelp)
            {
                ShowHelp(opt);
                Environment.Exit(0);
            }

            if (writeJson)
            {
                PrintJsonExample();
                Environment.Exit(0);       
            }

            if (string.IsNullOrEmpty(file))
            {
                System.Console.WriteLine("File path must be passed with -f or --f");
                Environment.Exit(1);
            }
            
        }
        private static void ShowHelp(OptionSet opt)
        {
            System.Console.WriteLine("Usage: Console ...");
            System.Console.WriteLine("Interact com MyContainerService");
            System.Console.WriteLine();
            System.Console.WriteLine("Options:");
            opt.WriteOptionDescriptions (System.Console.Out);
        }

        private static void PrintJsonExample()
        {
            var service = new MyService("test", "redis", "backend", "db_net")
            {
                Id = Guid.NewGuid().ToString(),
                Labels = new Dictionary<string, string>()
                {
                    {"createdByMyService", "true"}
                },
                Volumes = new List<Core.DTO.Volume>()
                {
                    new Core.DTO.Volume(false, "/tmp/data", "/app")
                },
                Ports = new List<Core.DTO.Port>()
                {
                    new Core.DTO.Port(80, "tcp")
                }
            };

            System.Console.WriteLine(JsonConvert.SerializeObject(service));
        }

        private static MyContainerService.MyContainerServiceClient GetServiceClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerService.MyContainerServiceClient(channel);
            return client;
        }

        private static GrpcChannel CreateChannel(string url)
        {
            var httpHandler = new HttpClientHandler();
            httpHandler.ServerCertificateCustomValidationCallback =
            HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;

            var channel = GrpcChannel.ForAddress(url,
            new GrpcChannelOptions { HttpHandler = httpHandler });
            return channel;
        }

        private static MyContainerImage.MyContainerImageClient GetImageClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerImage.MyContainerImageClient(channel);
            return client;
        }

        private static MyService ReadMyServiceJson(string jsonPath)
        {
            var json = File.ReadAllText(jsonPath);

            return JsonConvert.DeserializeObject<MyService>(json);
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                   Console/ServiceClientHandle.cs                                                                      0000644 0601755 0601001 00000003065 14026400242 015135  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ServiceClientHandle : ClientHandle, IServiceHandle
    {
        private readonly MyContainerService.MyContainerServiceClient _client;
        
        public ServiceClientHandle(MyContainerService.MyContainerServiceClient client, string token): base(token)
        {
            _client = client;
        }
        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var reply = await Task.Run(() =>  _client.Create(new CreateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }

        public Task<IEnumerable<MyService>> GetServices()
        {
            throw new System.NotImplementedException();
        }

        public async Task<string> RemoveService(string serviceId)
        {
             var reply = await Task.Run (() => _client.Remove(new RemoveRequest() {
                ServiceNameOrId = serviceId
            }, GetTokenHeader()));

            return reply.Message;
        }

        public async Task<string> UpdateService(MyService service)
        {
            var reply = await Task.Run(() => _client.Update(new UpdateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Console/Services/                                                                                   0000755 0601755 0601001 00000000000 14026347461 012527  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/Services/docker-compose.yml                                                                 0000644 0601755 0601001 00000000071 14026347461 016162  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                version: "3.7"
services:

  redis:
    image: redis
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Console/Services/myService.json                                                                     0000644 0601755 0601001 00000000717 14026643560 015374  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
    "Name": "mcs_MCS",
    "Image": "mcs:latest",
    "Networks": [
      "mcs_default"
    ],
    "Labels": {
      "createdByMyService": "true"
    },
    "Volumes": [
      {
        "ReadOnly": true,
        "Source": "/var/run/docker.sock",
        "Target": "/var/run/docker.sock"
      }
    ],
    "Ports": [
        {
          "InternalPort": 5000,
          "ExternalPort": 80,
          "Protocol": "tcp"
        }
      ]
  }                                                 Core/                                                                                               0000755 0601755 0601001 00000000000 14026647675 010244  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/Core.csproj                                                                                    0000644 0601755 0601001 00000000475 14026626642 012353  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   Core/DTO/                                                                                           0000755 0601755 0601001 00000000000 14026347461 010660  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/DTO/MyService.cs                                                                               0000644 0601755 0601001 00000007524 14026347461 013125  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;

namespace Core.DTO
{
    public class MyService
    {
        public MyService(string name, string image)
        {
            Name = name;
            Image = image;
        }

        public MyService(string name, string image, params string[] networks) : this(name, image)
        {
            Networks = networks?.ToList();
        }

        public MyService(string name, string image, IList<Volume> volumes) : this(name, image)
        {
            Volumes = volumes;
        }

        public MyService(string name, string image, IList<Volume> volumes, params string[] networks): this(name, image, volumes)
        {
            Networks = networks.ToList();
        }

        public MyService(string name, string image, TraefikConfig traefikConfig) : this(name, image)
        {
            AddTraefikLabels(traefikConfig);
        }

        public MyService()
        {
            
        }

        public string Id { get; set; }
        public string Name { get; init; }
        public string Image { get; init; }
        public int Version { get; set; }
        public IEnumerable<string> Networks { get; init; }
        public IDictionary<string, string> Labels { get; set; }
        public IEnumerable<Volume> Volumes { get; set; }
        public IEnumerable<Port> Ports { get; set; }

        private void AddTraefikLabels(TraefikConfig config)
        {
            if (Labels is null)
            {
                Labels = new Dictionary<string, string>()
                {
                    {"traefik.enable", "true"},
                    {$"traefik.http.services.{Name}.loadbalancer.server.port", config.InternalPort.ToString()},
                    {$"traefik.http.routers.{Name}.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}.entrypoints", config.HttpEntrypoint},
                    {$"traefik.http.middlewares.{Name}.redirectscheme.scheme", "https"},
                    {$"traefik.http.routers.{Name}.middlewares", Name},
                    {$"traefik.http.routers.{Name}-secured.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}-secured.entrypoints", config.HttpsEntrypoint},
                    {$"traefik.http.routers.{Name}-secured.tls", "true"},
                    {$"traefik.http.routers.{Name}-secured.tls.certresolver", config.CertResolver},
                    {$"traefik.docker.network", config.Network}
                };
            }
        }

    }

    public class Volume
    {
        public Volume(bool readOnly, string source, string target)
        {
            ReadOnly = readOnly;
            Source = source;
            Target = target;
        }

        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
    }

    public class Port
    {
        public Port(int internalPort, int externalPort, string protocol)
        {
            InternalPort = internalPort;
            ExternalPort = externalPort;
            Protocol = protocol;
        }

        
        public Port(int internalPort, string protocol)
        {
            InternalPort = internalPort;
            Protocol = protocol;
        }

        public Port()
        {
            
        }

        public int InternalPort { get; set; }
        public int? ExternalPort { get; set; }
        public string Protocol { get; set; }
    }

    public class TraefikConfig
    {
        public string Domain { get; init; }
        public int InternalPort { get; init; }
        public string HttpEntrypoint { get; init; }
        public string HttpsEntrypoint { get; init; }
        public string CertResolver { get; init; }
        public string Network { get; init; }
    }
}                                                                                                                                                                            Core/IImageHandle.cs                                                                                0000644 0601755 0601001 00000000366 14026626642 013036  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Core
{
    public interface IImageHandle
    {
        Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag);
    }
}                                                                                                                                                                                                                                                                          Core/IServiceHandle.cs                                                                              0000644 0601755 0601001 00000000625 14026370541 013404  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                
using System.Collections.Generic;
using System.Threading.Tasks;
using Core.DTO;

namespace Core
{
    public interface IServiceHandle
    {
        Task<string> CreateService(MyService service, bool ensureNetworks);
        Task<string> UpdateService(MyService service);
        Task<string> RemoveService(string serviceId);
        Task<IEnumerable<MyService>> GetServices();
    }
    
}                                                                                                           DI/                                                                                                 0000755 0601755 0601001 00000000000 14026647675 007650  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                DI/DependencyInjection.cs                                                                           0000644 0601755 0601001 00000002560 14026417663 014113  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System;
using HttpSocket;
using System.Net.Http;
using Docker;

namespace DI
{
    public static class DependencyInjection
    {
        public static void AddServiceHandle(this IServiceCollection services)
        {
            services.AddScoped<HttpClient>(x => UnixHttpClient.CreateHttpClient("/var/run/docker.sock"));
            services.AddScoped<IServiceHandle, DockerServiceHandle>();
            services.AddScoped<IImageHandle, DockerImageHandle>();
        }

        public static void AddTokenParser(this IServiceCollection services)
        {
            services.AddAuthentication()
                    .AddCookie(options => {
                        options.LoginPath = "/Account/Unauthorized/";
                        options.AccessDeniedPath = "/Account/Forbidden/";
                    })
                    .AddJwtBearer(options => {
                        options.Audience = "http://localhost:5001/";
                        options.Authority = "http://localhost:5000/";
                        options.RequireHttpsMetadata = false;
                        options.Validate("test");
                    });

            services.AddAuthorization();
        }

    }
}                                                                                                                                                DI/DI.csproj                                                                                        0000644 0601755 0601001 00000001504 14026626642 011355  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\Docker\Docker.csproj"/>
    <ProjectReference Include="..\HttpSocket\HttpSocket.csproj"/>
  </ItemGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.Extensions.DependencyInjection" Version="5.0.1"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication" Version="2.2.0"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                            Docker/                                                                                             0000755 0601755 0601001 00000000000 14026647675 010563  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Docker/Docker.csproj                                                                                0000644 0601755 0601001 00000000770 14026626642 013207  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
  </ItemGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>        Docker/DockerImageHandle.cs                                                                         0000644 0601755 0601001 00000003267 14026626642 014377  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Core;

namespace Docker
{
    public class DockerImageHandle : IImageHandle
    {
        private const string BUILD_URI = "/v1.24/build";
        private readonly HttpClient _httpClient;
        public DockerImageHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var buildArgs = GetBuildArgs(param);
            var query = HttpUtility.ParseQueryString(string.Empty);
            query.Add("t", tag);
            query.Add("q", "true");
            query.Add("buildargs", buildArgs);

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{BUILD_URI}?{query.ToString()}");

            var tarAsString = Encoding.UTF8.GetString(imageFile);

            requestMessage.Content = new StringContent(tarAsString, Encoding.UTF8, "application/x-tar");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private static string GetBuildArgs(IEnumerable<string> param)
        {
            var p = param.Select(x =>
            {
                var p = x.Split('=');
                return $"\"{p.FirstOrDefault()}\":\"{p.LastOrDefault()}\"";
            });

            var args = "{";
            args += $"{string.Join(',', p)}";
            args += "}";

            return args;
        }
    }
}                                                                                                                                                                                                                                                                                                                                         Docker/DockerService.cs                                                                             0000644 0601755 0601001 00000006552 14026645446 013644  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using System.Linq;
using System;

namespace Docker
{
   // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 

    public class DriverConfig
    {
    }

    public class Labels
    {
        [JsonProperty("com.example.something")]
        public string ComExampleSomething { get; set; }
        public string foo { get; set; }
    }

    public class VolumeOptions
    {
        public DriverConfig DriverConfig { get; set; }
        public Labels Labels { get; set; }
    }

    public class Mount
    {
        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
        public string Type { get; set; }
        public VolumeOptions VolumeOptions { get; set; }
    }

    public class ContainerSpec
    {
        public string Image { get; set; }
        public List<Mount> Mounts { get; set; }
        public string User { get; set; }
    }

    public class Network
    {
        public string Target { get; set; }
    }

    public class Options
    {
        [JsonProperty("max-file")]
        public string MaxFile { get; set; }

        [JsonProperty("max-size")]
        public string MaxSize { get; set; }
    }

    public class LogDriver
    {
        public string Name { get; set; }
        public Options Options { get; set; }
    }

    public class Placement
    {
        public List<string> Constraints { get; set; }
    }

    public class Limits
    {
        public int MemoryBytes { get; set; }
    }

    public class Reservations
    {
    }

    public class Resources
    {
        public Limits Limits { get; set; }
        public Reservations Reservations { get; set; }
    }

    public class RestartPolicy
    {
        public string Condition { get; set; }
        public long Delay { get; set; }
        public int MaxAttempts { get; set; }
    }

    public class TaskTemplate
    {
        public ContainerSpec ContainerSpec { get; set; }
        public List<Network> Networks { get; set; }
        public LogDriver LogDriver { get; set; }
        public Placement Placement { get; set; }
        public Resources Resources { get; set; }
        public RestartPolicy RestartPolicy { get; set; }
    }

    public class Replicated
    {
        public int Replicas { get; set; }
    }

    public class Mode
    {
        public Replicated Replicated { get; set; }
    }

    public class UpdateConfig
    {
        public long Delay { get; set; }
        public int Parallelism { get; set; }
        public string FailureAction { get; set; }
    }

    public class Port
    {
        public string Protocol { get; set; }
        public int PublishedPort { get; set; }
        public int TargetPort { get; set; }
    }

    public class EndpointSpec
    {
        public List<Port> Ports { get; set; }
    }

    public class DockerService
    {
        public string Name { get; set; }
        public TaskTemplate TaskTemplate { get; set; }
        public Mode Mode { get; set; }
        public UpdateConfig UpdateConfig { get; set; }
        public EndpointSpec EndpointSpec { get; set; }
        public IDictionary<string, string> Labels { get; set; }
    }


}                                                                                                                                                      Docker/DockerServiceHandle.cs                                                                       0000644 0601755 0601001 00000006660 14026647616 014761  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Newtonsoft.Json;
using System.IO;
using System;

namespace Docker
{
    public class DockerServiceHandle : IServiceHandle
    {
        private const string CREATE_URI = "/v1.24/services/create";
        private const string GET_URI = "/v1.24/services";
        private const string NETWORK_URI = "/v1.24/networks";
        private const string MEDIA_TYPE = "application/json";
        private readonly HttpClient _httpClient;
        
        public DockerServiceHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var dockerService = service.GetDockerService().Spec.AsJson();

            if (ensureNetworks)
            {
                EnsureNetworks(service.Networks);
            }
            
            var requestMessage = new HttpRequestMessage(HttpMethod.Post, CREATE_URI);

            requestMessage.Content = new StringContent(dockerService, Encoding.UTF8, MEDIA_TYPE);

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private void EnsureNetworks(IEnumerable<string> networks)
        {
            
        }

        public async Task<IEnumerable<MyService>> GetServices()
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, GET_URI);

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var dockerServices = body.FromJson<IList<DockerServiceResponse>>();
            
            return dockerServices.GetMyServices();
        }

        public async Task<string> RemoveService(string serviceId)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Delete, $"{GET_URI}/{serviceId}");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();
        }

        public async Task<string> UpdateService(MyService service)
        {
            var id = !string.IsNullOrEmpty(service.Id) ? service.Id : service.Name;

            var newVersion = await GetLastServiceVersion(id) + 1;

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{GET_URI}/{id}/update?version={newVersion}");

            var serviceDocker = service.GetDockerService().Spec.AsJson();

            requestMessage.Content = new StringContent(serviceDocker, Encoding.UTF8, MEDIA_TYPE);           

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync() + serviceDocker;
        }

        private async Task<int> GetLastServiceVersion(string id)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, $"{GET_URI}/{id}");

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var service = body.FromJson<DockerServiceResponse>();

            return service.Version;
        }
    }
}
                                                                                Docker/DockerServiceResponse.cs                                                                     0000644 0601755 0601001 00000001537 14026645411 015351  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

namespace Docker
{
    public class DockerServiceResponse    
    {
        public DockerService Spec { get; set; }
        public string ID { get; set; }
        [JsonProperty("Version.Index")]
        public int Version {get; set;}
        public string Image => Spec.TaskTemplate.ContainerSpec.Image;
        public string Name => Spec.Name;
        [JsonIgnore]
        public IEnumerable<string> Networks => Spec.TaskTemplate.Networks?.Select(x => x.Target);
        [JsonIgnore]
        public IDictionary<string, string> Labels => Spec.Labels;
        [JsonIgnore]
        public IEnumerable<Mount> Mounts => Spec.TaskTemplate.ContainerSpec.Mounts;
        [JsonIgnore]
        public IEnumerable<Port> Ports => Spec.EndpointSpec.Ports;
        

    }
}                                                                                                                                                                 Docker/Extensions.cs                                                                                0000644 0601755 0601001 00000005730 14026647616 013251  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using Core.DTO;
using Newtonsoft.Json;

namespace Docker
{
    public static class Extensions
    {
        public static DockerServiceResponse GetDockerService(this MyService myService)
        {
            return new DockerServiceResponse()
            {
                ID = myService.Id,
                Version = myService.Version,
                Spec = new DockerService()
                    {
                        Name = myService.Name,
                        Labels = myService.Labels,
                        TaskTemplate = new TaskTemplate()
                        {
                            ContainerSpec = new ContainerSpec()
                            {
                                Image = myService.Image,
                                Mounts = myService.Volumes?.Select(x => new Mount()
                                {
                                    ReadOnly = x.ReadOnly,
                                    Source = x?.Source,
                                    Target = x.Target
                                })?.ToList()
                            },
                            Networks = myService.Networks?.Select(x => new Network()
                            {
                                Target = x
                            
                            })?.ToList()
                        },
                        EndpointSpec = new EndpointSpec()
                        {
                            Ports = myService.Ports.Select(x => new Port()
                            {
                                Protocol = x.Protocol,
                                PublishedPort = x.ExternalPort ?? 0,
                                TargetPort = x.InternalPort
                            }).ToList()
                        }
                    }
            };
            
        }

        public static MyService GetMyService(this DockerServiceResponse service)
        {
           return new MyService(service.Name, service.Image, service.Networks?.ToArray())
           {
                Id = service.ID,
                Labels = service.Labels,
                Version = service.Version,
                Volumes = service.Mounts?.Select(x => new Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Ports?.Select(x => new Core.DTO.Port(x.TargetPort, x.PublishedPort, x.Protocol))
           };
        }

        public static IEnumerable<MyService> GetMyServices(this IEnumerable<DockerServiceResponse> containers)
        {
            return containers.Select(x => x.GetMyService());
        }

        public static T FromJson<T>(this string obj)
        {
            return JsonConvert.DeserializeObject<T>(obj);
        }

        public static string AsJson<T>(this T obj)
        {

            return JsonConvert.SerializeObject(obj);
        }

    }
}                                        Dockerfile                                                                                          0000644 0601755 0601001 00000000553 14026347461 011337  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                FROM mcr.microsoft.com/dotnet/sdk AS build
WORKDIR /src
COPY ./ ./
RUN dotnet restore Endpoint/Endpoint.csproj && dotnet publish Endpoint/Endpoint.csproj -c Release -o publish


FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /src/publish ./
EXPOSE 80
VOLUME /var/run/docker.sock
ENTRYPOINT ["dotnet", "Endpoint.dll"]                                                                                                                                                     Endpoint/                                                                                           0000755 0601755 0601001 00000000000 14026647675 011134  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/appsettings.Development.json                                                               0000644 0601755 0601001 00000000260 14026175111 016624  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "System": "Information",
      "Grpc": "Information",
      "Microsoft": "Information"
    }
  }
}
                                                                                                                                                                                                                                                                                                                                                Endpoint/appsettings.json                                                                           0000644 0601755 0601001 00000000407 14026175111 014346  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "Kestrel": {
    "EndpointDefaults": {
      "Protocols": "Http2"
    }
  }
}
                                                                                                                                                                                                                                                         Endpoint/Endpoint.csproj                                                                            0000644 0601755 0601001 00000001177 14026626642 014133  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk.Web">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\DI\DI.csproj"/>
    <ProjectReference Include="..\GRPC\GRPC.csproj"/>
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                                                                                                                                                                                                                                 Endpoint/Program.cs                                                                                 0000644 0601755 0601001 00000001554 14026175111 013054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        // Additional configuration is required to successfully run gRPC on macOS.
        // For instructions on how to configure Kestrel and gRPC clients on macOS, visit https://go.microsoft.com/fwlink/?linkid=2099682
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
                                                                                                                                                    Endpoint/Properties/                                                                                0000755 0601755 0601001 00000000000 14026175111 013245  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Properties/launchSettings.json                                                             0000644 0601755 0601001 00000000501 14026175111 017127  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿{
  "profiles": {
    "Endpoint": {
      "commandName": "Project",
      "dotnetRunMessages": "true",
      "launchBrowser": false,
      "applicationUrl": "http://localhost:5000;https://localhost:5001",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
                                                                                                                                                                                               Endpoint/Services/                                                                                  0000755 0601755 0601001 00000000000 14026626642 012706  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Services/MyContainerImageImpl.cs                                                           0000644 0601755 0601001 00000002333 14026626642 017253  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Google.Protobuf;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerImageImpl : MyContainerImage.MyContainerImageBase
    {
        private readonly IImageHandle _handle;
        private readonly ILogger<MyContainerImageImpl> _logger;
        public MyContainerImageImpl(ILogger<MyContainerImageImpl> logger, IImageHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<BuildReply> Build(BuildRequest request, ServerCallContext context)
        {
            var data = request.TarFile.ToByteArray();
            
            var tag = request.Tag;
            var param = request.Params.Select(x => x);
            var response = await _handle.BuildImage(data, param, tag);

            return new BuildReply()
            {
                Message = response
            };
        }
    }
}
                                                                                                                                                                                                                                                                                                     Endpoint/Services/MyContainerServiceImpl.cs                                                         0000644 0601755 0601001 00000003554 14026370657 017641  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Threading.Tasks;
using Core;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerServiceImpl : MyContainerService.MyContainerServiceBase
    {
        private readonly IServiceHandle _handle;
        private readonly ILogger<MyContainerServiceImpl> _logger;
        public MyContainerServiceImpl(ILogger<MyContainerServiceImpl> logger, IServiceHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<CreateReply> Create(CreateRequest request, ServerCallContext context)
        {
            var msg = await _handle.CreateService(request.Service.FromGrpcService(), true);
            return new CreateReply()
            {
                Message = msg
            };
        }

        public override async Task<GetReply> Get(GetRequest request, ServerCallContext context)
        {
            var reply = new GetReply();

            reply.Services.AddRange((await _handle.GetServices()).ToGrpcService());

            return reply;
        }

        public override async Task<RemoveReply> Remove(RemoveRequest request, ServerCallContext context)
        {
            return new RemoveReply()
            {
                Message = await _handle.RemoveService(request.ServiceNameOrId)
            };
        }

        public override async Task<UpdateReply> Update(UpdateRequest request, ServerCallContext context)
        {
            return new UpdateReply()
            {
                Message = await _handle.UpdateService(request.Service.FromGrpcService())
            };
        }
    }
}
                                                                                                                                                    Endpoint/Startup.cs                                                                                 0000644 0601755 0601001 00000002323 14026417663 013115  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using DI;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Startup
    {
        
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc();
            services.AddServiceHandle();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<MyContainerServiceImpl>();
                endpoints.MapGrpcService<MyContainerImageImpl>();

                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");
                });
            });
        }
    }
}
                                                                                                                                                                                                                                                                                                             GRPC/                                                                                               0000755 0601755 0601001 00000000000 14026647675 010107  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                GRPC/GRPC.csproj                                                                                    0000644 0601755 0601001 00000002333 14026626642 012054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
<ItemGroup>
    <Protobuf Include="..\Protos\myContainerService.proto" GrpcServices="Server,Client" />
    <Protobuf Include="..\Protos\myContainerImage.proto" GrpcServices="Server,Client" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.Core" Version="2.36.1" />
    <PackageReference Include="Grpc.Net.Client" Version="2.36.0" />
    <PackageReference Include="Grpc.Tools" Version="2.36.0" />
    <PackageReference Include="Google.Protobuf" Version="3.15.6" />
    <PackageReference Include="Grpc.Net.ClientFactory" Version="2.36.0" />
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
    <PackageReference Include="Mono.Options" Version="6.6.0.161" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.AspNetCore" Version="2.34.0" />
  </ItemGroup>

   <ItemGroup>
     <ProjectReference Include="..\Core\Core.csproj" />
   </ItemGroup>
   
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>

</Project>
                                                                                                                                                                                                                                                                                                     GRPC/GrpcServiceConversion.cs                                                                       0000644 0601755 0601001 00000005136 14026640563 014712  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Core.DTO;
using Endpoint;

namespace GRPC
{
    public static class GrpcServiceConversion
    {
        public static IEnumerable<MyService> FromGrpcService(this IEnumerable<Service> services)
        {
            return services.Select(x => x.FromGrpcService());
        }

        public static IEnumerable<Service> ToGrpcService(this IEnumerable<MyService> services)
        {
            return services.Select(x => x.ToGrpcService());
        }
        public static MyService FromGrpcService(this Service service)
        {
            return new MyService(service.Name, service.Image)
            {
                Id = service.Id,
                Version = service.Version,
                Labels = service.Labels.ToDictionary(x => x.Key, y => y.Value),
                Networks = service.Networks,
                Volumes = service.Volume?.Select(x => new Core.DTO.Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Port?.Select(x => new Core.DTO.Port(x.Target, x.Publish, x.Protocol))
            };
        }
        public static Service ToGrpcService(this MyService service)
        {
            var serviceGrpc = new Service
            {
                Id = service.Id ?? string.Empty,
                Name = service.Name,
                Image = service.Image,
                Version = service.Version
            };

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Labels.AddRange(service.Labels.Select(x => new Label()
                {
                    Key = x.Key,
                    Value = x.Value
                }));
            }

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Volume.AddRange(service.Volumes?.Select(x => new Endpoint.Volume()
                {
                    ReadOnly = x.ReadOnly,
                    Source = x.Source,
                    Target = x.Target
                }));
            }
            
            if (service.Networks?.Any() ?? false)
            {
                serviceGrpc.Networks.AddRange(service.Networks);
            }
            
            if (service.Ports?.Any() ?? false)
            {
                serviceGrpc.Port.AddRange(service.Ports?.Select(x => new Endpoint.Port()
                {
                    Protocol = x.Protocol,
                    Publish = x.ExternalPort ?? 0,
                    Target = x.InternalPort
                }));
            }

            return serviceGrpc;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                  HttpSocket/                                                                                         0000755 0601755 0601001 00000000000 14026647675 011444  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                HttpSocket/HttpSocket.csproj                                                                        0000644 0601755 0601001 00000000475 14026626642 014753  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   HttpSocket/UnixHttpClient.cs                                                                        0000644 0601755 0601001 00000002150 14026175111 014670  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Net.Http;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;

namespace HttpSocket 
{
    public class UnixHttpClient
    {
        private static UnixDomainSocketEndPoint _endPoint;

        private static async ValueTask<Stream> SocketConnectionAsync(SocketsHttpConnectionContext socketsHttpConnectionContext, CancellationToken cancellationToken)
        {
            var socket = new Socket(AddressFamily.Unix, SocketType.Stream, ProtocolType.IP);
            
            await socket.ConnectAsync(_endPoint);
            
            return  new NetworkStream(socket);;
        }

        public static HttpClient CreateHttpClient(string unixSockPath)
        {
            var con = new SocketsHttpHandler();

            con.ConnectCallback = SocketConnectionAsync;
            
            var httpClient = new HttpClient(con);

            httpClient.BaseAddress = new System.Uri("http://hub.docker.io");

            _endPoint = new UnixDomainSocketEndPoint(unixSockPath);

            return httpClient;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                        MyContainerService.sln                                                                              0000644 0601755 0601001 00000020244 14026347461 013633  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 16
VisualStudioVersion = 16.6.30114.105
MinimumVisualStudioVersion = 10.0.40219.1
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Core", "Core\Core.csproj", "{2F123D68-1A07-4292-ACB0-C1DE7630BF07}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Docker", "Docker\Docker.csproj", "{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Endpoint", "Endpoint\Endpoint.csproj", "{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "DI", "DI\DI.csproj", "{59D12BD5-00EA-45A2-8991-379E2A955483}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "GRPC", "GRPC\GRPC.csproj", "{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "HttpSocket", "HttpSocket\HttpSocket.csproj", "{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Console", "Console\Console.csproj", "{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Debug|x64 = Debug|x64
		Debug|x86 = Debug|x86
		Release|Any CPU = Release|Any CPU
		Release|x64 = Release|x64
		Release|x86 = Release|x86
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.Build.0 = Release|Any CPU
	EndGlobalSection
EndGlobal
                                                                                                                                                                                                                                                                                                                                                            Protos/                                                                                             0000755 0601755 0601001 00000000000 14026626642 010631  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Protos/myContainerImage.proto                                                                       0000644 0601755 0601001 00000000511 14026626642 015146  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerimage;

service MyContainerImage {
  rpc Build (BuildRequest) returns (BuildReply);
 
}

message BuildRequest {
  bytes tarFile = 1;
  string tag = 2;
  repeated string params = 3;
}

message BuildReply {
  string message = 1;
}

                                                                                                                                                                                       Protos/myContainerService.proto                                                                     0000644 0601755 0601001 00000002272 14026642764 015535  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerservice;

service MyContainerService {
  rpc Create (CreateRequest) returns (CreateReply);
  rpc Update (UpdateRequest) returns (UpdateReply);
  rpc Remove (RemoveRequest) returns (RemoveReply);
  rpc Get (GetRequest) returns (GetReply);
}

message CreateRequest {
  Service service =1;
}

message UpdateRequest {
  Service service = 1;
}

message RemoveRequest {
  string serviceNameOrId = 1;
}

message GetRequest {
}

message CreateReply {
  string message = 1;
}

message UpdateReply {
  string message = 1;
}

message RemoveReply {
  string message = 1;
}

message GetReply {
  repeated Service services = 1;
}

message Service {
  string id = 1;
  string name = 2;
  string image = 3;

  repeated string networks = 4;
  repeated Label labels = 5;
  repeated Volume volume = 6;
  repeated Port port = 7;
  int32 version = 8;
}

message Label {
  string key = 1;
  string value = 2;
}

message Volume {
  string source = 1;
  string target = 2;
  bool readOnly = 3;
}

message Port {
  int32 target = 1;
  int32 publish = 2;
  string protocol = 3;
}



                                                                                                                                                                                                                                                                                                                                      README.md                                                                                           0000644 0601755 0601001 00000001000 14026417663 010612  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                # MyContainerService
This is an simple abstraction of Docker (For now) Services API to easily and safely manage services from anywhere.

:warning: Be very careful with production use. **Credentials not implemented yet**.

# ToDo
- [ ] Tests, tests, tests and more tests.
- [x] GRPC Endpoint.
- [x] CLI that recives MyService json to pass on Endpoint.
- [ ] Load docker-compose.yaml.
- [ ] GRPC Authentication.
- [ ] Integrate with Kubernetes.
- [ ] UI prefered in VueJS.
- [ ] Increment this ToDo.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Console/Program.cs                                                                                  0000644 0601755 0601001 00000016175 14026640566 012716  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using Endpoint;
using Core.DTO;
using Grpc.Net.Client;
using System;
using System.Net.Http;
using System.IO;
using Newtonsoft.Json;
using System.Collections.Generic;
using Mono.Options;
using Grpc.Core;
using GRPC;
using Core;

namespace Console
{
    public enum Actions
    {
        Create,
        Update,
        Remove,
        List,
        Build,
        Non
    }
    class Program
    {
        private static string url = "https://localhost:5001";
        private static string file = string.Empty;
        private static Actions action = Actions.Non;
        private static string token = string.Empty;
        private static string tag = "latest";
        private static IList<string> buildParam = new List<string>();
        private static IServiceHandle _serviceHandle;
        private static IImageHandle _imageHandle;

        static void Main(string[] args)
        {

            try
            {
                ParserArgs(args);

                switch(action)
                {
                    case Actions.Create:
                        Create();
                        break;
                    case Actions.Remove:
                        Remove();
                        break;
                    case Actions.Update:
                        Update();
                        break;
                    case Actions.Build:
                        BuildImage();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException("Invalid action informed.");
                }
            }
            catch (Exception e)
            {
                System.Console.WriteLine(e.Message);
            }

        }
        private static void BuildImage()
        {
            if (!File.Exists(file))
            {
                throw new FileNotFoundException();
            }
            
            _imageHandle = new ImageClientHandle(GetImageClient(url), token);

            var fileBytes = File.ReadAllBytes(file);

            var reply = _imageHandle.BuildImage(fileBytes, buildParam, tag).Result;

            System.Console.WriteLine(reply);

        }
        private static void Update()
        {   
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

           var reply = _serviceHandle.UpdateService(service).Result;

            System.Console.WriteLine(reply);
        }

        private static void Remove()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var reply = _serviceHandle.RemoveService(service.Id ?? service.Name).Result;

            System.Console.WriteLine(reply);
        }

        private static void Create()
        {
            var service = ReadMyServiceJson(file);

            _serviceHandle = new ServiceClientHandle(GetServiceClient(url), token);

            var response = _serviceHandle.CreateService(service, true).Result;

            System.Console.WriteLine(response);
        }

        private static void ParserArgs(IEnumerable<string> args)
        {
            var showHelp = false;
            var writeJson = false;
            var opt = new OptionSet()
            {
                {"u|url=", "The url of grpc endpoints", u => url = u },
                {"f|file=", "The json of service or tar of image to be handled", j => file = j},
                {"t|tag=", "The image tag to build. If not passed, latest be default.", t => tag = t },
                {"p|param=", "The param to build. Ex: foo=bar", p => buildParam.Add(p) },
                {"a|action=", "The action to perform (create,update,remove)", a => action = (Actions)Enum.Parse(typeof(Actions), a)},
                {"w|write", "Write json example", w => writeJson = w != null},
                {"h|help", "Print help", h => showHelp = h != null}
            };

            try
            {
                opt.Parse(args);
            }
            catch (OptionException e)
            {
                System.Console.WriteLine (e.Message);
                System.Console.WriteLine ("Try `Console --help' for more information.");
                return;
            }

            if (showHelp)
            {
                ShowHelp(opt);
                Environment.Exit(0);
            }

            if (writeJson)
            {
                PrintJsonExample();
                Environment.Exit(0);       
            }

            if (string.IsNullOrEmpty(file))
            {
                System.Console.WriteLine("File path must be passed with -f or --f");
                Environment.Exit(1);
            }
            
        }
        private static void ShowHelp(OptionSet opt)
        {
            System.Console.WriteLine("Usage: Console ...");
            System.Console.WriteLine("Interact com MyContainerService");
            System.Console.WriteLine();
            System.Console.WriteLine("Options:");
            opt.WriteOptionDescriptions (System.Console.Out);
        }

        private static void PrintJsonExample()
        {
            var service = new MyService("test", "redis", "backend", "db_net")
            {
                Id = Guid.NewGuid().ToString(),
                Labels = new Dictionary<string, string>()
                {
                    {"createdByMyService", "true"}
                },
                Volumes = new List<Core.DTO.Volume>()
                {
                    new Core.DTO.Volume(false, "/tmp/data", "/app")
                },
                Ports = new List<Core.DTO.Port>()
                {
                    new Core.DTO.Port(80, "tcp")
                }
            };

            System.Console.WriteLine(JsonConvert.SerializeObject(service));
        }

        private static MyContainerService.MyContainerServiceClient GetServiceClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerService.MyContainerServiceClient(channel);
            return client;
        }

        private static GrpcChannel CreateChannel(string url)
        {
            var httpHandler = new HttpClientHandler();
            httpHandler.ServerCertificateCustomValidationCallback =
            HttpClientHandler.DangerousAcceptAnyServerCertificateValidator;

            var channel = GrpcChannel.ForAddress(url,
            new GrpcChannelOptions { HttpHandler = httpHandler });
            return channel;
        }

        private static MyContainerImage.MyContainerImageClient GetImageClient(string url)
        {
            GrpcChannel channel = CreateChannel(url);

            var client = new MyContainerImage.MyContainerImageClient(channel);
            return client;
        }

        private static MyService ReadMyServiceJson(string jsonPath)
        {
            var json = File.ReadAllText(jsonPath);

            return JsonConvert.DeserializeObject<MyService>(json);
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                   Console/ServiceClientHandle.cs                                                                      0000644 0601755 0601001 00000003065 14026400242 015135  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Endpoint;
using Grpc.Core;
using GRPC;

namespace Console
{
    internal class ServiceClientHandle : ClientHandle, IServiceHandle
    {
        private readonly MyContainerService.MyContainerServiceClient _client;
        
        public ServiceClientHandle(MyContainerService.MyContainerServiceClient client, string token): base(token)
        {
            _client = client;
        }
        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var reply = await Task.Run(() =>  _client.Create(new CreateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }

        public Task<IEnumerable<MyService>> GetServices()
        {
            throw new System.NotImplementedException();
        }

        public async Task<string> RemoveService(string serviceId)
        {
             var reply = await Task.Run (() => _client.Remove(new RemoveRequest() {
                ServiceNameOrId = serviceId
            }, GetTokenHeader()));

            return reply.Message;
        }

        public async Task<string> UpdateService(MyService service)
        {
            var reply = await Task.Run(() => _client.Update(new UpdateRequest()
            {
                Service = service.ToGrpcService()
            }, GetTokenHeader()));

            return reply.Message;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                           Console/Services/                                                                                   0000755 0601755 0601001 00000000000 14026347461 012527  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Console/Services/docker-compose.yml                                                                 0000644 0601755 0601001 00000000071 14026347461 016162  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                version: "3.7"
services:

  redis:
    image: redis
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       Console/Services/myService.json                                                                     0000644 0601755 0601001 00000000717 14026643560 015374  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
    "Name": "mcs_MCS",
    "Image": "mcs:latest",
    "Networks": [
      "mcs_default"
    ],
    "Labels": {
      "createdByMyService": "true"
    },
    "Volumes": [
      {
        "ReadOnly": true,
        "Source": "/var/run/docker.sock",
        "Target": "/var/run/docker.sock"
      }
    ],
    "Ports": [
        {
          "InternalPort": 5000,
          "ExternalPort": 80,
          "Protocol": "tcp"
        }
      ]
  }                                                 Core/                                                                                               0000755 0601755 0601001 00000000000 14026661564 010235  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/Core.csproj                                                                                    0000644 0601755 0601001 00000000475 14026626642 012353  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   Core/DTO/                                                                                           0000755 0601755 0601001 00000000000 14026347461 010660  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Core/DTO/MyService.cs                                                                               0000644 0601755 0601001 00000007524 14026347461 013125  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;

namespace Core.DTO
{
    public class MyService
    {
        public MyService(string name, string image)
        {
            Name = name;
            Image = image;
        }

        public MyService(string name, string image, params string[] networks) : this(name, image)
        {
            Networks = networks?.ToList();
        }

        public MyService(string name, string image, IList<Volume> volumes) : this(name, image)
        {
            Volumes = volumes;
        }

        public MyService(string name, string image, IList<Volume> volumes, params string[] networks): this(name, image, volumes)
        {
            Networks = networks.ToList();
        }

        public MyService(string name, string image, TraefikConfig traefikConfig) : this(name, image)
        {
            AddTraefikLabels(traefikConfig);
        }

        public MyService()
        {
            
        }

        public string Id { get; set; }
        public string Name { get; init; }
        public string Image { get; init; }
        public int Version { get; set; }
        public IEnumerable<string> Networks { get; init; }
        public IDictionary<string, string> Labels { get; set; }
        public IEnumerable<Volume> Volumes { get; set; }
        public IEnumerable<Port> Ports { get; set; }

        private void AddTraefikLabels(TraefikConfig config)
        {
            if (Labels is null)
            {
                Labels = new Dictionary<string, string>()
                {
                    {"traefik.enable", "true"},
                    {$"traefik.http.services.{Name}.loadbalancer.server.port", config.InternalPort.ToString()},
                    {$"traefik.http.routers.{Name}.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}.entrypoints", config.HttpEntrypoint},
                    {$"traefik.http.middlewares.{Name}.redirectscheme.scheme", "https"},
                    {$"traefik.http.routers.{Name}.middlewares", Name},
                    {$"traefik.http.routers.{Name}-secured.rule", $"Host({config.Domain})"},
                    {$"traefik.http.routers.{Name}-secured.entrypoints", config.HttpsEntrypoint},
                    {$"traefik.http.routers.{Name}-secured.tls", "true"},
                    {$"traefik.http.routers.{Name}-secured.tls.certresolver", config.CertResolver},
                    {$"traefik.docker.network", config.Network}
                };
            }
        }

    }

    public class Volume
    {
        public Volume(bool readOnly, string source, string target)
        {
            ReadOnly = readOnly;
            Source = source;
            Target = target;
        }

        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
    }

    public class Port
    {
        public Port(int internalPort, int externalPort, string protocol)
        {
            InternalPort = internalPort;
            ExternalPort = externalPort;
            Protocol = protocol;
        }

        
        public Port(int internalPort, string protocol)
        {
            InternalPort = internalPort;
            Protocol = protocol;
        }

        public Port()
        {
            
        }

        public int InternalPort { get; set; }
        public int? ExternalPort { get; set; }
        public string Protocol { get; set; }
    }

    public class TraefikConfig
    {
        public string Domain { get; init; }
        public int InternalPort { get; init; }
        public string HttpEntrypoint { get; init; }
        public string HttpsEntrypoint { get; init; }
        public string CertResolver { get; init; }
        public string Network { get; init; }
    }
}                                                                                                                                                                            Core/IImageHandle.cs                                                                                0000644 0601755 0601001 00000000366 14026626642 013036  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Core
{
    public interface IImageHandle
    {
        Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag);
    }
}                                                                                                                                                                                                                                                                          Core/IServiceHandle.cs                                                                              0000644 0601755 0601001 00000000625 14026370541 013404  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                
using System.Collections.Generic;
using System.Threading.Tasks;
using Core.DTO;

namespace Core
{
    public interface IServiceHandle
    {
        Task<string> CreateService(MyService service, bool ensureNetworks);
        Task<string> UpdateService(MyService service);
        Task<string> RemoveService(string serviceId);
        Task<IEnumerable<MyService>> GetServices();
    }
    
}                                                                                                           DI/                                                                                                 0000755 0601755 0601001 00000000000 14026661564 007641  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                DI/DependencyInjection.cs                                                                           0000644 0601755 0601001 00000002560 14026417663 014113  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using Core;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using System;
using HttpSocket;
using System.Net.Http;
using Docker;

namespace DI
{
    public static class DependencyInjection
    {
        public static void AddServiceHandle(this IServiceCollection services)
        {
            services.AddScoped<HttpClient>(x => UnixHttpClient.CreateHttpClient("/var/run/docker.sock"));
            services.AddScoped<IServiceHandle, DockerServiceHandle>();
            services.AddScoped<IImageHandle, DockerImageHandle>();
        }

        public static void AddTokenParser(this IServiceCollection services)
        {
            services.AddAuthentication()
                    .AddCookie(options => {
                        options.LoginPath = "/Account/Unauthorized/";
                        options.AccessDeniedPath = "/Account/Forbidden/";
                    })
                    .AddJwtBearer(options => {
                        options.Audience = "http://localhost:5001/";
                        options.Authority = "http://localhost:5000/";
                        options.RequireHttpsMetadata = false;
                        options.Validate("test");
                    });

            services.AddAuthorization();
        }

    }
}                                                                                                                                                DI/DI.csproj                                                                                        0000644 0601755 0601001 00000001504 14026626642 011355  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\Docker\Docker.csproj"/>
    <ProjectReference Include="..\HttpSocket\HttpSocket.csproj"/>
  </ItemGroup>
  <ItemGroup>
    <PackageReference Include="Microsoft.Extensions.DependencyInjection" Version="5.0.1"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication" Version="2.2.0"/>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                            Docker/                                                                                             0000755 0601755 0601001 00000000000 14026661564 010554  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Docker/Docker.csproj                                                                                0000644 0601755 0601001 00000000770 14026626642 013207  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj" />
  </ItemGroup>

    <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>        Docker/DockerImageHandle.cs                                                                         0000644 0601755 0601001 00000003267 14026626642 014377  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Core;

namespace Docker
{
    public class DockerImageHandle : IImageHandle
    {
        private const string BUILD_URI = "/v1.24/build";
        private readonly HttpClient _httpClient;
        public DockerImageHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<string> BuildImage(byte[] imageFile, IEnumerable<string> param, string tag)
        {
            var buildArgs = GetBuildArgs(param);
            var query = HttpUtility.ParseQueryString(string.Empty);
            query.Add("t", tag);
            query.Add("q", "true");
            query.Add("buildargs", buildArgs);

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{BUILD_URI}?{query.ToString()}");

            var tarAsString = Encoding.UTF8.GetString(imageFile);

            requestMessage.Content = new StringContent(tarAsString, Encoding.UTF8, "application/x-tar");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private static string GetBuildArgs(IEnumerable<string> param)
        {
            var p = param.Select(x =>
            {
                var p = x.Split('=');
                return $"\"{p.FirstOrDefault()}\":\"{p.LastOrDefault()}\"";
            });

            var args = "{";
            args += $"{string.Join(',', p)}";
            args += "}";

            return args;
        }
    }
}                                                                                                                                                                                                                                                                                                                                         Docker/DockerService.cs                                                                             0000644 0601755 0601001 00000006552 14026645446 013644  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Text.Json.Serialization;
using Newtonsoft.Json;
using System.Linq;
using System;

namespace Docker
{
   // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 

    public class DriverConfig
    {
    }

    public class Labels
    {
        [JsonProperty("com.example.something")]
        public string ComExampleSomething { get; set; }
        public string foo { get; set; }
    }

    public class VolumeOptions
    {
        public DriverConfig DriverConfig { get; set; }
        public Labels Labels { get; set; }
    }

    public class Mount
    {
        public bool ReadOnly { get; set; }
        public string Source { get; set; }
        public string Target { get; set; }
        public string Type { get; set; }
        public VolumeOptions VolumeOptions { get; set; }
    }

    public class ContainerSpec
    {
        public string Image { get; set; }
        public List<Mount> Mounts { get; set; }
        public string User { get; set; }
    }

    public class Network
    {
        public string Target { get; set; }
    }

    public class Options
    {
        [JsonProperty("max-file")]
        public string MaxFile { get; set; }

        [JsonProperty("max-size")]
        public string MaxSize { get; set; }
    }

    public class LogDriver
    {
        public string Name { get; set; }
        public Options Options { get; set; }
    }

    public class Placement
    {
        public List<string> Constraints { get; set; }
    }

    public class Limits
    {
        public int MemoryBytes { get; set; }
    }

    public class Reservations
    {
    }

    public class Resources
    {
        public Limits Limits { get; set; }
        public Reservations Reservations { get; set; }
    }

    public class RestartPolicy
    {
        public string Condition { get; set; }
        public long Delay { get; set; }
        public int MaxAttempts { get; set; }
    }

    public class TaskTemplate
    {
        public ContainerSpec ContainerSpec { get; set; }
        public List<Network> Networks { get; set; }
        public LogDriver LogDriver { get; set; }
        public Placement Placement { get; set; }
        public Resources Resources { get; set; }
        public RestartPolicy RestartPolicy { get; set; }
    }

    public class Replicated
    {
        public int Replicas { get; set; }
    }

    public class Mode
    {
        public Replicated Replicated { get; set; }
    }

    public class UpdateConfig
    {
        public long Delay { get; set; }
        public int Parallelism { get; set; }
        public string FailureAction { get; set; }
    }

    public class Port
    {
        public string Protocol { get; set; }
        public int PublishedPort { get; set; }
        public int TargetPort { get; set; }
    }

    public class EndpointSpec
    {
        public List<Port> Ports { get; set; }
    }

    public class DockerService
    {
        public string Name { get; set; }
        public TaskTemplate TaskTemplate { get; set; }
        public Mode Mode { get; set; }
        public UpdateConfig UpdateConfig { get; set; }
        public EndpointSpec EndpointSpec { get; set; }
        public IDictionary<string, string> Labels { get; set; }
    }


}                                                                                                                                                      Docker/DockerServiceHandle.cs                                                                       0000644 0601755 0601001 00000006660 14026647616 014761  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using Core;
using Core.DTO;
using Newtonsoft.Json;
using System.IO;
using System;

namespace Docker
{
    public class DockerServiceHandle : IServiceHandle
    {
        private const string CREATE_URI = "/v1.24/services/create";
        private const string GET_URI = "/v1.24/services";
        private const string NETWORK_URI = "/v1.24/networks";
        private const string MEDIA_TYPE = "application/json";
        private readonly HttpClient _httpClient;
        
        public DockerServiceHandle(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> CreateService(MyService service, bool ensureNetworks)
        {
            var dockerService = service.GetDockerService().Spec.AsJson();

            if (ensureNetworks)
            {
                EnsureNetworks(service.Networks);
            }
            
            var requestMessage = new HttpRequestMessage(HttpMethod.Post, CREATE_URI);

            requestMessage.Content = new StringContent(dockerService, Encoding.UTF8, MEDIA_TYPE);

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();

        }

        private void EnsureNetworks(IEnumerable<string> networks)
        {
            
        }

        public async Task<IEnumerable<MyService>> GetServices()
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, GET_URI);

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var dockerServices = body.FromJson<IList<DockerServiceResponse>>();
            
            return dockerServices.GetMyServices();
        }

        public async Task<string> RemoveService(string serviceId)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Delete, $"{GET_URI}/{serviceId}");

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync();
        }

        public async Task<string> UpdateService(MyService service)
        {
            var id = !string.IsNullOrEmpty(service.Id) ? service.Id : service.Name;

            var newVersion = await GetLastServiceVersion(id) + 1;

            var requestMessage = new HttpRequestMessage(HttpMethod.Post, $"{GET_URI}/{id}/update?version={newVersion}");

            var serviceDocker = service.GetDockerService().Spec.AsJson();

            requestMessage.Content = new StringContent(serviceDocker, Encoding.UTF8, MEDIA_TYPE);           

            var response = await _httpClient.SendAsync(requestMessage);

            return await response.Content.ReadAsStringAsync() + serviceDocker;
        }

        private async Task<int> GetLastServiceVersion(string id)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, $"{GET_URI}/{id}");

            var response = await _httpClient.SendAsync(requestMessage);

            var body = await response.Content.ReadAsStringAsync();

            var service = body.FromJson<DockerServiceResponse>();

            return service.Version;
        }
    }
}
                                                                                Docker/DockerServiceResponse.cs                                                                     0000644 0601755 0601001 00000001537 14026645411 015351  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

namespace Docker
{
    public class DockerServiceResponse    
    {
        public DockerService Spec { get; set; }
        public string ID { get; set; }
        [JsonProperty("Version.Index")]
        public int Version {get; set;}
        public string Image => Spec.TaskTemplate.ContainerSpec.Image;
        public string Name => Spec.Name;
        [JsonIgnore]
        public IEnumerable<string> Networks => Spec.TaskTemplate.Networks?.Select(x => x.Target);
        [JsonIgnore]
        public IDictionary<string, string> Labels => Spec.Labels;
        [JsonIgnore]
        public IEnumerable<Mount> Mounts => Spec.TaskTemplate.ContainerSpec.Mounts;
        [JsonIgnore]
        public IEnumerable<Port> Ports => Spec.EndpointSpec.Ports;
        

    }
}                                                                                                                                                                 Docker/Extensions.cs                                                                                0000644 0601755 0601001 00000005730 14026647616 013251  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using Core.DTO;
using Newtonsoft.Json;

namespace Docker
{
    public static class Extensions
    {
        public static DockerServiceResponse GetDockerService(this MyService myService)
        {
            return new DockerServiceResponse()
            {
                ID = myService.Id,
                Version = myService.Version,
                Spec = new DockerService()
                    {
                        Name = myService.Name,
                        Labels = myService.Labels,
                        TaskTemplate = new TaskTemplate()
                        {
                            ContainerSpec = new ContainerSpec()
                            {
                                Image = myService.Image,
                                Mounts = myService.Volumes?.Select(x => new Mount()
                                {
                                    ReadOnly = x.ReadOnly,
                                    Source = x?.Source,
                                    Target = x.Target
                                })?.ToList()
                            },
                            Networks = myService.Networks?.Select(x => new Network()
                            {
                                Target = x
                            
                            })?.ToList()
                        },
                        EndpointSpec = new EndpointSpec()
                        {
                            Ports = myService.Ports.Select(x => new Port()
                            {
                                Protocol = x.Protocol,
                                PublishedPort = x.ExternalPort ?? 0,
                                TargetPort = x.InternalPort
                            }).ToList()
                        }
                    }
            };
            
        }

        public static MyService GetMyService(this DockerServiceResponse service)
        {
           return new MyService(service.Name, service.Image, service.Networks?.ToArray())
           {
                Id = service.ID,
                Labels = service.Labels,
                Version = service.Version,
                Volumes = service.Mounts?.Select(x => new Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Ports?.Select(x => new Core.DTO.Port(x.TargetPort, x.PublishedPort, x.Protocol))
           };
        }

        public static IEnumerable<MyService> GetMyServices(this IEnumerable<DockerServiceResponse> containers)
        {
            return containers.Select(x => x.GetMyService());
        }

        public static T FromJson<T>(this string obj)
        {
            return JsonConvert.DeserializeObject<T>(obj);
        }

        public static string AsJson<T>(this T obj)
        {

            return JsonConvert.SerializeObject(obj);
        }

    }
}                                        Dockerfile                                                                                          0000644 0601755 0601001 00000000553 14026347461 011337  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                FROM mcr.microsoft.com/dotnet/sdk AS build
WORKDIR /src
COPY ./ ./
RUN dotnet restore Endpoint/Endpoint.csproj && dotnet publish Endpoint/Endpoint.csproj -c Release -o publish


FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS runtime
WORKDIR /app
COPY --from=build /src/publish ./
EXPOSE 80
VOLUME /var/run/docker.sock
ENTRYPOINT ["dotnet", "Endpoint.dll"]                                                                                                                                                     Endpoint/                                                                                           0000755 0601755 0601001 00000000000 14026661564 011125  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/appsettings.Development.json                                                               0000644 0601755 0601001 00000000260 14026175111 016624  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "System": "Information",
      "Grpc": "Information",
      "Microsoft": "Information"
    }
  }
}
                                                                                                                                                                                                                                                                                                                                                Endpoint/appsettings.json                                                                           0000644 0601755 0601001 00000000407 14026175111 014346  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                {
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "Kestrel": {
    "EndpointDefaults": {
      "Protocols": "Http2"
    }
  }
}
                                                                                                                                                                                                                                                         Endpoint/Endpoint.csproj                                                                            0000644 0601755 0601001 00000001177 14026626642 014133  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk.Web">
  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="..\Core\Core.csproj"/>
    <ProjectReference Include="..\DI\DI.csproj"/>
    <ProjectReference Include="..\GRPC\GRPC.csproj"/>
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="5.0.4"/>
  </ItemGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>                                                                                                                                                                                                                                                                                                                                                                                                 Endpoint/Program.cs                                                                                 0000644 0601755 0601001 00000001554 14026175111 013054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        // Additional configuration is required to successfully run gRPC on macOS.
        // For instructions on how to configure Kestrel and gRPC clients on macOS, visit https://go.microsoft.com/fwlink/?linkid=2099682
        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
                                                                                                                                                    Endpoint/Properties/                                                                                0000755 0601755 0601001 00000000000 14026175111 013245  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Properties/launchSettings.json                                                             0000644 0601755 0601001 00000000501 14026175111 017127  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿{
  "profiles": {
    "Endpoint": {
      "commandName": "Project",
      "dotnetRunMessages": "true",
      "launchBrowser": false,
      "applicationUrl": "http://localhost:5000;https://localhost:5001",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
                                                                                                                                                                                               Endpoint/Services/                                                                                  0000755 0601755 0601001 00000000000 14026626642 012706  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Endpoint/Services/MyContainerImageImpl.cs                                                           0000644 0601755 0601001 00000002333 14026626642 017253  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Core;
using Google.Protobuf;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerImageImpl : MyContainerImage.MyContainerImageBase
    {
        private readonly IImageHandle _handle;
        private readonly ILogger<MyContainerImageImpl> _logger;
        public MyContainerImageImpl(ILogger<MyContainerImageImpl> logger, IImageHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<BuildReply> Build(BuildRequest request, ServerCallContext context)
        {
            var data = request.TarFile.ToByteArray();
            
            var tag = request.Tag;
            var param = request.Params.Select(x => x);
            var response = await _handle.BuildImage(data, param, tag);

            return new BuildReply()
            {
                Message = response
            };
        }
    }
}
                                                                                                                                                                                                                                                                                                     Endpoint/Services/MyContainerServiceImpl.cs                                                         0000644 0601755 0601001 00000003554 14026370657 017641  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Threading.Tasks;
using Core;
using Grpc.Core;
using GRPC;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Logging;

namespace Endpoint
{
    //[Authorize(AuthenticationSchemes = 
    //JwtBearerDefaults.AuthenticationScheme)]
    public  class MyContainerServiceImpl : MyContainerService.MyContainerServiceBase
    {
        private readonly IServiceHandle _handle;
        private readonly ILogger<MyContainerServiceImpl> _logger;
        public MyContainerServiceImpl(ILogger<MyContainerServiceImpl> logger, IServiceHandle handle)
        {
            _logger = logger;
            _handle = handle;
        }

        public override async Task<CreateReply> Create(CreateRequest request, ServerCallContext context)
        {
            var msg = await _handle.CreateService(request.Service.FromGrpcService(), true);
            return new CreateReply()
            {
                Message = msg
            };
        }

        public override async Task<GetReply> Get(GetRequest request, ServerCallContext context)
        {
            var reply = new GetReply();

            reply.Services.AddRange((await _handle.GetServices()).ToGrpcService());

            return reply;
        }

        public override async Task<RemoveReply> Remove(RemoveRequest request, ServerCallContext context)
        {
            return new RemoveReply()
            {
                Message = await _handle.RemoveService(request.ServiceNameOrId)
            };
        }

        public override async Task<UpdateReply> Update(UpdateRequest request, ServerCallContext context)
        {
            return new UpdateReply()
            {
                Message = await _handle.UpdateService(request.Service.FromGrpcService())
            };
        }
    }
}
                                                                                                                                                    Endpoint/Startup.cs                                                                                 0000644 0601755 0601001 00000002323 14026417663 013115  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿using DI;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace Endpoint
{
    public class Startup
    {
        
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddGrpc();
            services.AddServiceHandle();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapGrpcService<MyContainerServiceImpl>();
                endpoints.MapGrpcService<MyContainerImageImpl>();

                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");
                });
            });
        }
    }
}
                                                                                                                                                                                                                                                                                                             GRPC/                                                                                               0000755 0601755 0601001 00000000000 14026661564 010100  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                GRPC/GRPC.csproj                                                                                    0000644 0601755 0601001 00000002333 14026626642 012054  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
<ItemGroup>
    <Protobuf Include="..\Protos\myContainerService.proto" GrpcServices="Server,Client" />
    <Protobuf Include="..\Protos\myContainerImage.proto" GrpcServices="Server,Client" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.Core" Version="2.36.1" />
    <PackageReference Include="Grpc.Net.Client" Version="2.36.0" />
    <PackageReference Include="Grpc.Tools" Version="2.36.0" />
    <PackageReference Include="Google.Protobuf" Version="3.15.6" />
    <PackageReference Include="Grpc.Net.ClientFactory" Version="2.36.0" />
    <PackageReference Include="Newtonsoft.Json" Version="12.0.3" />
    <PackageReference Include="Mono.Options" Version="6.6.0.161" />
  </ItemGroup>

   <ItemGroup>
    <PackageReference Include="Grpc.AspNetCore" Version="2.34.0" />
  </ItemGroup>

   <ItemGroup>
     <ProjectReference Include="..\Core\Core.csproj" />
   </ItemGroup>
   
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>

</Project>
                                                                                                                                                                                                                                                                                                     GRPC/GrpcServiceConversion.cs                                                                       0000644 0601755 0601001 00000005136 14026640563 014712  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.Collections.Generic;
using System.Linq;
using Core.DTO;
using Endpoint;

namespace GRPC
{
    public static class GrpcServiceConversion
    {
        public static IEnumerable<MyService> FromGrpcService(this IEnumerable<Service> services)
        {
            return services.Select(x => x.FromGrpcService());
        }

        public static IEnumerable<Service> ToGrpcService(this IEnumerable<MyService> services)
        {
            return services.Select(x => x.ToGrpcService());
        }
        public static MyService FromGrpcService(this Service service)
        {
            return new MyService(service.Name, service.Image)
            {
                Id = service.Id,
                Version = service.Version,
                Labels = service.Labels.ToDictionary(x => x.Key, y => y.Value),
                Networks = service.Networks,
                Volumes = service.Volume?.Select(x => new Core.DTO.Volume(x.ReadOnly, x.Source, x.Target)),
                Ports = service.Port?.Select(x => new Core.DTO.Port(x.Target, x.Publish, x.Protocol))
            };
        }
        public static Service ToGrpcService(this MyService service)
        {
            var serviceGrpc = new Service
            {
                Id = service.Id ?? string.Empty,
                Name = service.Name,
                Image = service.Image,
                Version = service.Version
            };

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Labels.AddRange(service.Labels.Select(x => new Label()
                {
                    Key = x.Key,
                    Value = x.Value
                }));
            }

            if (service.Labels?.Any() ?? false)
            {
                serviceGrpc.Volume.AddRange(service.Volumes?.Select(x => new Endpoint.Volume()
                {
                    ReadOnly = x.ReadOnly,
                    Source = x.Source,
                    Target = x.Target
                }));
            }
            
            if (service.Networks?.Any() ?? false)
            {
                serviceGrpc.Networks.AddRange(service.Networks);
            }
            
            if (service.Ports?.Any() ?? false)
            {
                serviceGrpc.Port.AddRange(service.Ports?.Select(x => new Endpoint.Port()
                {
                    Protocol = x.Protocol,
                    Publish = x.ExternalPort ?? 0,
                    Target = x.InternalPort
                }));
            }

            return serviceGrpc;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                  HttpSocket/                                                                                         0000755 0601755 0601001 00000000000 14026661564 011435  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                HttpSocket/HttpSocket.csproj                                                                        0000644 0601755 0601001 00000000475 14026626642 014753  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                <Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
  </PropertyGroup>
  <Target Name="SpicNSpan"  AfterTargets="Clean">
      <RemoveDir Directories="$(BaseIntermediateOutputPath)" />
      <RemoveDir Directories="$(BaseOutputPath)" />
  </Target>
</Project>
                                                                                                                                                                                                   HttpSocket/UnixHttpClient.cs                                                                        0000644 0601755 0601001 00000002150 14026175111 014670  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                using System.IO;
using System.Net.Http;
using System.Net.Sockets;
using System.Threading;
using System.Threading.Tasks;

namespace HttpSocket 
{
    public class UnixHttpClient
    {
        private static UnixDomainSocketEndPoint _endPoint;

        private static async ValueTask<Stream> SocketConnectionAsync(SocketsHttpConnectionContext socketsHttpConnectionContext, CancellationToken cancellationToken)
        {
            var socket = new Socket(AddressFamily.Unix, SocketType.Stream, ProtocolType.IP);
            
            await socket.ConnectAsync(_endPoint);
            
            return  new NetworkStream(socket);;
        }

        public static HttpClient CreateHttpClient(string unixSockPath)
        {
            var con = new SocketsHttpHandler();

            con.ConnectCallback = SocketConnectionAsync;
            
            var httpClient = new HttpClient(con);

            httpClient.BaseAddress = new System.Uri("http://hub.docker.io");

            _endPoint = new UnixDomainSocketEndPoint(unixSockPath);

            return httpClient;
        }
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                        MyContainerService.sln                                                                              0000644 0601755 0601001 00000020244 14026347461 013633  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                ﻿
Microsoft Visual Studio Solution File, Format Version 12.00
# Visual Studio Version 16
VisualStudioVersion = 16.6.30114.105
MinimumVisualStudioVersion = 10.0.40219.1
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Core", "Core\Core.csproj", "{2F123D68-1A07-4292-ACB0-C1DE7630BF07}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Docker", "Docker\Docker.csproj", "{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Endpoint", "Endpoint\Endpoint.csproj", "{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "DI", "DI\DI.csproj", "{59D12BD5-00EA-45A2-8991-379E2A955483}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "GRPC", "GRPC\GRPC.csproj", "{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "HttpSocket", "HttpSocket\HttpSocket.csproj", "{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}"
EndProject
Project("{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}") = "Console", "Console\Console.csproj", "{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}"
EndProject
Global
	GlobalSection(SolutionConfigurationPlatforms) = preSolution
		Debug|Any CPU = Debug|Any CPU
		Debug|x64 = Debug|x64
		Debug|x86 = Debug|x86
		Release|Any CPU = Release|Any CPU
		Release|x64 = Release|x64
		Release|x86 = Release|x86
	EndGlobalSection
	GlobalSection(SolutionProperties) = preSolution
		HideSolutionNode = FALSE
	EndGlobalSection
	GlobalSection(ProjectConfigurationPlatforms) = postSolution
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x64.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.ActiveCfg = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Debug|x86.Build.0 = Debug|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|Any CPU.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x64.Build.0 = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.ActiveCfg = Release|Any CPU
		{2F123D68-1A07-4292-ACB0-C1DE7630BF07}.Release|x86.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x64.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.ActiveCfg = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Debug|x86.Build.0 = Debug|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|Any CPU.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x64.Build.0 = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.ActiveCfg = Release|Any CPU
		{C2B25851-3A45-4855-89A4-5FBA6EDE83D5}.Release|x86.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x64.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.ActiveCfg = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Debug|x86.Build.0 = Debug|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|Any CPU.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x64.Build.0 = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.ActiveCfg = Release|Any CPU
		{5B2104BE-9578-4C2B-BA7E-8A9B871F697F}.Release|x86.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x64.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.ActiveCfg = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Debug|x86.Build.0 = Debug|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|Any CPU.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x64.Build.0 = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.ActiveCfg = Release|Any CPU
		{59D12BD5-00EA-45A2-8991-379E2A955483}.Release|x86.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x64.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.ActiveCfg = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Debug|x86.Build.0 = Debug|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|Any CPU.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x64.Build.0 = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.ActiveCfg = Release|Any CPU
		{57AAC2DC-BB3F-4385-B1F1-ADF16721CDC2}.Release|x86.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x64.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.ActiveCfg = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Debug|x86.Build.0 = Debug|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|Any CPU.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x64.Build.0 = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.ActiveCfg = Release|Any CPU
		{14EC7E5A-7C8F-46B9-9ECD-6DCB71B3988D}.Release|x86.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|Any CPU.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x64.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.ActiveCfg = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Debug|x86.Build.0 = Debug|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|Any CPU.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x64.Build.0 = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.ActiveCfg = Release|Any CPU
		{CB8F39E3-B1EE-4CF9-9074-94677F1866D3}.Release|x86.Build.0 = Release|Any CPU
	EndGlobalSection
EndGlobal
                                                                                                                                                                                                                                                                                                                                                            Protos/                                                                                             0000755 0601755 0601001 00000000000 14026626642 010631  5                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                Protos/myContainerImage.proto                                                                       0000644 0601755 0601001 00000000511 14026626642 015146  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerimage;

service MyContainerImage {
  rpc Build (BuildRequest) returns (BuildReply);
 
}

message BuildRequest {
  bytes tarFile = 1;
  string tag = 2;
  repeated string params = 3;
}

message BuildReply {
  string message = 1;
}

                                                                                                                                                                                       Protos/myContainerService.proto                                                                     0000644 0601755 0601001 00000002272 14026642764 015535  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                syntax = "proto3";

option csharp_namespace = "Endpoint";

package mycontainerservice;

service MyContainerService {
  rpc Create (CreateRequest) returns (CreateReply);
  rpc Update (UpdateRequest) returns (UpdateReply);
  rpc Remove (RemoveRequest) returns (RemoveReply);
  rpc Get (GetRequest) returns (GetReply);
}

message CreateRequest {
  Service service =1;
}

message UpdateRequest {
  Service service = 1;
}

message RemoveRequest {
  string serviceNameOrId = 1;
}

message GetRequest {
}

message CreateReply {
  string message = 1;
}

message UpdateReply {
  string message = 1;
}

message RemoveReply {
  string message = 1;
}

message GetReply {
  repeated Service services = 1;
}

message Service {
  string id = 1;
  string name = 2;
  string image = 3;

  repeated string networks = 4;
  repeated Label labels = 5;
  repeated Volume volume = 6;
  repeated Port port = 7;
  int32 version = 8;
}

message Label {
  string key = 1;
  string value = 2;
}

message Volume {
  string source = 1;
  string target = 2;
  bool readOnly = 3;
}

message Port {
  int32 target = 1;
  int32 publish = 2;
  string protocol = 3;
}



                                                                                                                                                                                                                                                                                                                                      README.md                                                                                           0000644 0601755 0601001 00000001000 14026417663 010612  0                                                                                                    ustar   Matheus                                                                                                                                                                                                                                                # MyContainerService
This is an simple abstraction of Docker (For now) Services API to easily and safely manage services from anywhere.

:warning: Be very careful with production use. **Credentials not implemented yet**.

# ToDo
- [ ] Tests, tests, tests and more tests.
- [x] GRPC Endpoint.
- [x] CLI that recives MyService json to pass on Endpoint.
- [ ] Load docker-compose.yaml.
- [ ] GRPC Authentication.
- [ ] Integrate with Kubernetes.
- [ ] UI prefered in VueJS.
- [ ] Increment this ToDo.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                