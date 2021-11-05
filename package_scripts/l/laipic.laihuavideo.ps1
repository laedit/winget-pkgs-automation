$result = (Invoke-RestMethod -Uri "https://video.laihua.com/common/config?type=15").data.videoUpdate | ConvertFrom-Json
if ($result.versionCode -gt $package.last_checked_tag)
{
    $update_found = $true
    $version = $result.versionCode
    $jsonTag = $result.versionCode
    $urls.Add($result.downloadUrl) | Out-Null
}
else
{
    $update_found = $false
}
