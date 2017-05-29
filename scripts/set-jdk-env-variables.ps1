# ����Java SDK ��������

$softwares = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* 
$jdk = $softwares  | Where-Object DisplayName -Match 'Java SE Development Kit'

if ($jdk.Count -gt 1) {
    Write-Host "�ҵ����JDK��װ����:"
    $id = 1
    foreach ($e in $jdk) {
        Write-Host "${id}." $e.DisplayName
        $id++
    }
    $choice = [int](Read-Host -Prompt "Ӧ��ʹ���ĸ�?")
    $jdk = $jdk[$choice]
}

$install_location = $jdk.InstallLocation.trim('\')
# ȥ��·������б��
Write-Host "���ְ�װλ��: ${install_location}"

# ���û�������
$java_home = $install_location
$classpath = "%JAVA_HOME%\lib;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar"
$path = "%JAVA_HOME%\bin;" + $env:Path

[Environment]::SetEnvironmentVariable("JAVA_HOME", $java_home, "Machine")
[Environment]::SetEnvironmentVariable("CLASSPATH", $classpath, "Machine")
[Environment]::SetEnvironmentVariable("PATH", $path , "Machine")


Write-Host "����JDK���������ɹ�"