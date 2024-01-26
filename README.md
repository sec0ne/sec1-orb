# Sec1 Security Orb


[![CircleCI Build Status](https://circleci.com/gh/sec0ne/sec1-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/sec0ne/sec1-orb) [![CircleCI Orb Version](https://badges.circleci.com/orbs/sec1/sec1-orb.svg)](https://circleci.com/developer/orbs/orb/sec1/sec1-orb) [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/sec0ne/sec1-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)



Enhance the security of your applications with the seamless integration of Sec1 and [CircleCI](https://circleci.com) using the **Sec1 Orb**. This integration allows for thorough scanning of your application dependencies, identifying and addressing open source security vulnerabilities as an integral part of your continuous integration/continuous delivery (CI/CD) workflow.

CircleCI simplifies CI/CD workflows through the use of ready-to-use commands, known as [Orbs](https://circleci.com/orbs/), which can be effortlessly added to your configuration file.

By leveraging the Sec1 Orb, you can effortlessly incorporate Sec1 Security into your CI/CD process, scanning for open source vulnerabilities based on your specified configurations.

## Prerequisites for CircleCI Integration

Ensure a smooth implementation of CircleCI integration with Sec1 by following these prerequisites:

1. **Sec1 Account:** Create a Sec1 account and retrieve the **Sec1 API token** from your **Account settings**.
2. **Repo Import:** Import the relevant repository into CircleCI.
3. **Security Settings:** In CircleCI, navigate to `Organization Settings -> Security -> Orb security settings` and enable `opt-in to third party (partner and community) Orbs`.
4. **Environment Variables:** Add the environment variables to CircleCI, navigate to `Project Settings -> Environment Variables -> Add Environmnent Variable`. Set the key as 'SEC1_API_KEY' and value as your sec1 api token.


## Implementing the Sec1 Orb

Follow the comprehensive information provided in the [Sec1 Circle CI README](https://circleci.com/developer/orbs/orb/sec1/sec1-orb) to seamlessly set up your CI/CD with Sec1. The README includes a detailed list of parameters and sample configurations to ensure a successful integration.


## Example 

### Sec1 Security Scan

> Be sure to use the latest version of the [Sec1 ORB](https://circleci.com/developer/orbs/orb/sec1/sec1-orb)

```yaml
version: 2.1

orbs:
  sec1-orb: sec1/sec1-orb@1.0.14
  
jobs:
  build:
    docker:
      - image: cimg/node:lts
    steps:
      - sec1-orb/scan:
          api_key: ${SEC1_API_KEY}

workflows:
  my-workflow:
    jobs:
      - build
```

### Customizing Scan Thresholds

Sec1 scan supports setting up threshold values. If the scan reports vulnerabilities exceeding the specified thresholds, Sec1 Security will mark the build as failed. You can set threshold values for different severities such as critical, high, medium, and low.

```yaml
version: 2.1

orbs:
  sec1-orb: sec1/sec1-orb@1.0.14
  
jobs:
  build:
    docker:
      - image: cimg/node:lts
    steps:
      - sec1-orb/scan:
          api_key: ${SEC1_API_KEY}
          scan_threshold: critical=0 high=0 medium=0
workflows:
  my-workflow:
    jobs:
      - build
```

## Understanding CircleCI Integration

Upon integrating your project with CircleCI and seamlessly integrating the Sec1 Orb into your configuration file, each build execution initiates the Sec1 Orb to execute essential tasks:

1. **Dependency Scan:** Rigorously examines your application dependencies, meticulously identifying potential vulnerabilities and presenting a comprehensive list of issues for your attention.
2. **Build Outcome:** Aligned with your precision-configured thresholds, Sec1 diligently evaluates the scan results. In the event of detected vulnerabilities surpassing the defined threshold, the build process is aptly flagged as unsuccessful. This approach ensures a stringent adherence to your predetermined security standards, contributing to the creation of a resilient and secure codebase with each build iteration..



Your CircleCI/CD environment is now configured to harness the capabilities of Sec1, facilitating continuous security assessments within your projects. This integration establishes a robust mechanism for ongoing security checks throughout your CI/CD pipeline, ensuring a proactive approach to identifying and addressing potential vulnerabilities in your software development lifecycle.

## Resources

[CircleCI Orb Registry Page](https://circleci.com/developer/orbs/orb/sec1/sec1-orb) - The official registry page of this orb for all versions, executors, commands, and jobs described.

[CircleCI Orb Docs](https://circleci.com/docs/orb-intro/#section=configuration) - Docs for using, creating, and publishing CircleCI Orbs.

[Sec1 Circle CI Integration User Docs](https://docs.sec1.io/user-docs/integrate-with-sec1/ci-cd-integrations/circleci-orb-integration) - Refer this for Sec1 Circle CI integration using orb

### How to Contribute

We welcome [issues](https://github.com/sec0ne/sec1-orb/issues) to and [pull requests](https://github.com/sec0ne/sec1-orb/pulls) against this repository!

### How to Publish An Update
1. Merge pull requests with desired changes to the main branch.
    - For the best experience, squash-and-merge and use [Conventional Commit Messages](https://conventionalcommits.org/).
2. Find the current version of the orb.
    - You can run `circleci orb info sec1/sec1-orb | grep "Latest"` to see the current version.
3. Create a [new Release](https://github.com/sec0ne/sec1-orb/releases/new) on GitHub.
    - Click "Choose a tag" and _create_ a new [semantically versioned](http://semver.org/) tag. (ex: v1.0.0)
      - We will have an opportunity to change this before we publish if needed after the next step.
4.  Click _"+ Auto-generate release notes"_.
    - This will create a summary of all of the merged pull requests since the previous release.
    - If you have used _[Conventional Commit Messages](https://conventionalcommits.org/)_ it will be easy to determine what types of changes were made, allowing you to ensure the correct version tag is being published.
5. Now ensure the version tag selected is semantically accurate based on the changes included.
6. Click _"Publish Release"_.
    - This will push a new tag and trigger your publishing pipeline on CircleCI.
