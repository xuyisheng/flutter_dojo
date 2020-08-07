import 'dart:convert' show json;

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }

  return null;
}

class FeedEntity {
  FeedEntity({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory FeedEntity.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<Items> items = jsonRes['items'] is List ? <Items>[] : null;
    if (items != null) {
      for (final dynamic item in jsonRes['items']) {
        if (item != null) {
          items.add(Items.fromJson(asT<Map<String, dynamic>>(item)));
        }
      }
    }
    return FeedEntity(
      totalCount: asT<int>(jsonRes['total_count']),
      incompleteResults: asT<bool>(jsonRes['incomplete_results']),
      items: items,
    );
  }

  int totalCount;
  bool incompleteResults;
  List<Items> items;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total_count': totalCount,
        'incomplete_results': incompleteResults,
        'items': items,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Items {
  Items({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });

  factory Items.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Items(
          id: asT<int>(jsonRes['id']),
          nodeId: asT<String>(jsonRes['node_id']),
          name: asT<String>(jsonRes['name']),
          fullName: asT<String>(jsonRes['full_name']),
          private: asT<bool>(jsonRes['private']),
          owner: Owner.fromJson(asT<Map<String, dynamic>>(jsonRes['owner'])),
          htmlUrl: asT<String>(jsonRes['html_url']),
          description: asT<String>(jsonRes['description']),
          fork: asT<bool>(jsonRes['fork']),
          url: asT<String>(jsonRes['url']),
          forksUrl: asT<String>(jsonRes['forks_url']),
          keysUrl: asT<String>(jsonRes['keys_url']),
          collaboratorsUrl: asT<String>(jsonRes['collaborators_url']),
          teamsUrl: asT<String>(jsonRes['teams_url']),
          hooksUrl: asT<String>(jsonRes['hooks_url']),
          issueEventsUrl: asT<String>(jsonRes['issue_events_url']),
          eventsUrl: asT<String>(jsonRes['events_url']),
          assigneesUrl: asT<String>(jsonRes['assignees_url']),
          branchesUrl: asT<String>(jsonRes['branches_url']),
          tagsUrl: asT<String>(jsonRes['tags_url']),
          blobsUrl: asT<String>(jsonRes['blobs_url']),
          gitTagsUrl: asT<String>(jsonRes['git_tags_url']),
          gitRefsUrl: asT<String>(jsonRes['git_refs_url']),
          treesUrl: asT<String>(jsonRes['trees_url']),
          statusesUrl: asT<String>(jsonRes['statuses_url']),
          languagesUrl: asT<String>(jsonRes['languages_url']),
          stargazersUrl: asT<String>(jsonRes['stargazers_url']),
          contributorsUrl: asT<String>(jsonRes['contributors_url']),
          subscribersUrl: asT<String>(jsonRes['subscribers_url']),
          subscriptionUrl: asT<String>(jsonRes['subscription_url']),
          commitsUrl: asT<String>(jsonRes['commits_url']),
          gitCommitsUrl: asT<String>(jsonRes['git_commits_url']),
          commentsUrl: asT<String>(jsonRes['comments_url']),
          issueCommentUrl: asT<String>(jsonRes['issue_comment_url']),
          contentsUrl: asT<String>(jsonRes['contents_url']),
          compareUrl: asT<String>(jsonRes['compare_url']),
          mergesUrl: asT<String>(jsonRes['merges_url']),
          archiveUrl: asT<String>(jsonRes['archive_url']),
          downloadsUrl: asT<String>(jsonRes['downloads_url']),
          issuesUrl: asT<String>(jsonRes['issues_url']),
          pullsUrl: asT<String>(jsonRes['pulls_url']),
          milestonesUrl: asT<String>(jsonRes['milestones_url']),
          notificationsUrl: asT<String>(jsonRes['notifications_url']),
          labelsUrl: asT<String>(jsonRes['labels_url']),
          releasesUrl: asT<String>(jsonRes['releases_url']),
          deploymentsUrl: asT<String>(jsonRes['deployments_url']),
          createdAt: asT<String>(jsonRes['created_at']),
          updatedAt: asT<String>(jsonRes['updated_at']),
          pushedAt: asT<String>(jsonRes['pushed_at']),
          gitUrl: asT<String>(jsonRes['git_url']),
          sshUrl: asT<String>(jsonRes['ssh_url']),
          cloneUrl: asT<String>(jsonRes['clone_url']),
          svnUrl: asT<String>(jsonRes['svn_url']),
          homepage: asT<Object>(jsonRes['homepage']),
          size: asT<int>(jsonRes['size']),
          stargazersCount: asT<int>(jsonRes['stargazers_count']),
          watchersCount: asT<int>(jsonRes['watchers_count']),
          language: asT<String>(jsonRes['language']),
          hasIssues: asT<bool>(jsonRes['has_issues']),
          hasProjects: asT<bool>(jsonRes['has_projects']),
          hasDownloads: asT<bool>(jsonRes['has_downloads']),
          hasWiki: asT<bool>(jsonRes['has_wiki']),
          hasPages: asT<bool>(jsonRes['has_pages']),
          forksCount: asT<int>(jsonRes['forks_count']),
          mirrorUrl: asT<Object>(jsonRes['mirror_url']),
          archived: asT<bool>(jsonRes['archived']),
          disabled: asT<bool>(jsonRes['disabled']),
          openIssuesCount: asT<int>(jsonRes['open_issues_count']),
          license: License.fromJson(asT<Map<String, dynamic>>(jsonRes['license'])),
          forks: asT<int>(jsonRes['forks']),
          openIssues: asT<int>(jsonRes['open_issues']),
          watchers: asT<int>(jsonRes['watchers']),
          defaultBranch: asT<String>(jsonRes['default_branch']),
          score: asT<int>(jsonRes['score']),
        );

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner owner;
  String htmlUrl;
  String description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  String createdAt;
  String updatedAt;
  String pushedAt;
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  Object homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String language;
  bool hasIssues;
  bool hasProjects;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  Object mirrorUrl;
  bool archived;
  bool disabled;
  int openIssuesCount;
  License license;
  int forks;
  int openIssues;
  int watchers;
  String defaultBranch;
  int score;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'node_id': nodeId,
        'name': name,
        'full_name': fullName,
        'private': private,
        'owner': owner,
        'html_url': htmlUrl,
        'description': description,
        'fork': fork,
        'url': url,
        'forks_url': forksUrl,
        'keys_url': keysUrl,
        'collaborators_url': collaboratorsUrl,
        'teams_url': teamsUrl,
        'hooks_url': hooksUrl,
        'issue_events_url': issueEventsUrl,
        'events_url': eventsUrl,
        'assignees_url': assigneesUrl,
        'branches_url': branchesUrl,
        'tags_url': tagsUrl,
        'blobs_url': blobsUrl,
        'git_tags_url': gitTagsUrl,
        'git_refs_url': gitRefsUrl,
        'trees_url': treesUrl,
        'statuses_url': statusesUrl,
        'languages_url': languagesUrl,
        'stargazers_url': stargazersUrl,
        'contributors_url': contributorsUrl,
        'subscribers_url': subscribersUrl,
        'subscription_url': subscriptionUrl,
        'commits_url': commitsUrl,
        'git_commits_url': gitCommitsUrl,
        'comments_url': commentsUrl,
        'issue_comment_url': issueCommentUrl,
        'contents_url': contentsUrl,
        'compare_url': compareUrl,
        'merges_url': mergesUrl,
        'archive_url': archiveUrl,
        'downloads_url': downloadsUrl,
        'issues_url': issuesUrl,
        'pulls_url': pullsUrl,
        'milestones_url': milestonesUrl,
        'notifications_url': notificationsUrl,
        'labels_url': labelsUrl,
        'releases_url': releasesUrl,
        'deployments_url': deploymentsUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'pushed_at': pushedAt,
        'git_url': gitUrl,
        'ssh_url': sshUrl,
        'clone_url': cloneUrl,
        'svn_url': svnUrl,
        'homepage': homepage,
        'size': size,
        'stargazers_count': stargazersCount,
        'watchers_count': watchersCount,
        'language': language,
        'has_issues': hasIssues,
        'has_projects': hasProjects,
        'has_downloads': hasDownloads,
        'has_wiki': hasWiki,
        'has_pages': hasPages,
        'forks_count': forksCount,
        'mirror_url': mirrorUrl,
        'archived': archived,
        'disabled': disabled,
        'open_issues_count': openIssuesCount,
        'license': license,
        'forks': forks,
        'open_issues': openIssues,
        'watchers': watchers,
        'default_branch': defaultBranch,
        'score': score,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class Owner {
  Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : Owner(
          login: asT<String>(jsonRes['login']),
          id: asT<int>(jsonRes['id']),
          nodeId: asT<String>(jsonRes['node_id']),
          avatarUrl: asT<String>(jsonRes['avatar_url']),
          gravatarId: asT<String>(jsonRes['gravatar_id']),
          url: asT<String>(jsonRes['url']),
          htmlUrl: asT<String>(jsonRes['html_url']),
          followersUrl: asT<String>(jsonRes['followers_url']),
          followingUrl: asT<String>(jsonRes['following_url']),
          gistsUrl: asT<String>(jsonRes['gists_url']),
          starredUrl: asT<String>(jsonRes['starred_url']),
          subscriptionsUrl: asT<String>(jsonRes['subscriptions_url']),
          organizationsUrl: asT<String>(jsonRes['organizations_url']),
          reposUrl: asT<String>(jsonRes['repos_url']),
          eventsUrl: asT<String>(jsonRes['events_url']),
          receivedEventsUrl: asT<String>(jsonRes['received_events_url']),
          type: asT<String>(jsonRes['type']),
          siteAdmin: asT<bool>(jsonRes['site_admin']),
        );

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  factory License.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : License(
          key: asT<String>(jsonRes['key']),
          name: asT<String>(jsonRes['name']),
          spdxId: asT<String>(jsonRes['spdx_id']),
          url: asT<String>(jsonRes['url']),
          nodeId: asT<String>(jsonRes['node_id']),
        );

  String key;
  String name;
  String spdxId;
  String url;
  String nodeId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'name': name,
        'spdx_id': spdxId,
        'url': url,
        'node_id': nodeId,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
