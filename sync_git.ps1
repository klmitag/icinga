$GitHubRepository = 'icinga'$GitHubLocalRepoRoot = $env:USERPROFILE + '\Git'$GitHubRepositoryRoot = $GitHubLocalRepoRoot + '\' + $GitHubRepository
Set-Location $GitHubRepositoryRoot
$sync = git pull upstream master