$result = (Invoke-WebRequest -Uri $package.repo_uri -UseBasicParsing | ConvertFrom-Json).result
if ($result.version -gt $package.last_checked_tag)
{
    $update_found = $true
    $version = $result.version
    $jsonTag = $result.version
    $urls.Add($result.addr) | Out-Null
}
else
{
    $update_found = $false
}