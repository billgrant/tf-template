# Terraform Template Repository

This repository is a template containing boilerplate code for HCP Terraform demonstrations that utilize the GitHub Terraform provider.

## Purpose

This template is designed to be used by demo workspaces or Terraform modules to create one or more GitHub repositories programmatically. When used with the [GitHub Terraform provider](https://registry.terraform.io/providers/integrations/github/latest/docs), it provides a consistent starting point for demonstrating HCP Terraform capabilities.

## What's Included

This template includes basic Terraform configuration files with boilerplate code:

- **main.tf** - Sample Terraform resources (includes a `random_pet` resource as an example)
- **variables.tf** - Placeholder for variable definitions
- **outputs.tf** - Sample output configurations

## Usage

1. Use this repository as a template when creating new repositories via the GitHub Terraform provider
2. The GitHub provider will create new repositories based on this template's structure and content
3. Customize the generated repositories as needed for your specific demo scenarios

## Example

This template is commonly used in HCP Terraform demos to showcase:
- Automated repository creation using Infrastructure as Code
- GitHub provider integration with HCP Terraform
- Workspace and module management workflows

For more information about using templates with the GitHub Terraform provider, see the [GitHub provider documentation](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository).
