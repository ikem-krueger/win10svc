# Windows 10 Service Repair Tool

The Windows 10 Service Repair Tool is a small tool to reset the Windows 10 services back to their default states.

| Operating system | Dependencies         | Status | License  |
| :--------------- | :------------------- | :----- | :------- |
| Windows 10       | .NET 4.6.1           | Alpha  | AGPL-3.0 |

## Installation:

### Build:

```
csc win10svc.cs /reference:System.IO.Compression.FileSystem.dll 
```
