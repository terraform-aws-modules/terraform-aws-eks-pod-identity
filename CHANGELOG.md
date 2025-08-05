# Changelog

All notable changes to this project will be documented in this file.

## [2.0.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.12.1...v2.0.0) (2025-08-05)


### ⚠ BREAKING CHANGES

* Update Terraform and AWS provider versions to `1.5.7` and `6.2` respectively (#40)

### Features

* Update Terraform and AWS provider versions to `1.5.7` and `6.2` respectively ([#40](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/40)) ([df2656b](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/df2656b80afbb64c08e68765be144f732d98aa81))

## [1.12.1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.12.0...v1.12.1) (2025-07-05)


### Bug Fixes

* Update IAM policy for External Secrets  ([#38](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/38)) ([8083c02](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/8083c02f7337c1a827118b5fed8d63745a8507bd))

## [1.12.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.11.0...v1.12.0) (2025-06-03)


### Features

* Update AWS Load Balancer controller policy to match v2.13 of the upstream project ([#36](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/36)) ([b1898a2](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/b1898a2709a1cb56fea5d609038fff61bba7dd78))

## [1.11.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.10.0...v1.11.0) (2025-03-12)


### Features

* Update IAM permissions for load balancer controller v2.12.0 ([#33](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/33)) ([36379bc](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/36379bcb3b5b62038e7936936d1bbedf28936157))

## [1.10.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.9.1...v1.10.0) (2025-01-29)


### Features

* Add `ec2:DescribeSubnets` policy to `aws-vpc-cni` ([#29](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/29)) ([2f1907b](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/2f1907baf15677a0efe1afc4ba7075b7525acb9e))

## [1.9.1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.9.0...v1.9.1) (2025-01-09)


### Bug Fixes

* Fix IAM policy for External Secrets ([#28](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/28)) ([9bc8032](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/9bc80322946b7f047e36129a1ea293d460ba66a4))

## [1.9.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.8.0...v1.9.0) (2024-12-27)


### Features

* Update policies for AWS LBC v2.11.0 ([#27](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/27)) ([f5c4932](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/f5c4932da8586d90ed57179aa1c9270394b0ac81))

## [1.8.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.7.0...v1.8.0) (2024-12-27)


### Features

* Update policie for External Secrets 0.12.1 ([#26](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/26)) ([b63aaf1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/b63aaf1edeee9e1e2eaff7d3a9503971c09fc47e))

## [1.7.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.6.1...v1.7.0) (2024-11-11)


### Features

* Add `ec2:GetSecurityGroupsForVpc` for AWS LB Controller `v2.10.0` ([#25](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/25)) ([dfef351](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/dfef351722163fc20212291db5025dc62a2d2ec0))

## [1.6.1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.6.0...v1.6.1) (2024-10-22)


### Bug Fixes

* Use dynamic partition value ([#23](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/23)) ([85f71d9](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/85f71d9c3a1d590407c0c358a012818e8efee66f))

## [1.6.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.5.0...v1.6.0) (2024-10-21)


### Features

* Update AWS EBS CSI Driver IAM Policy ([#22](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/22)) ([18e6434](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/18e64340b3eb298e76676c6bdeff8292bd5ef510))


### Bug Fixes

* Update CI workflow versions to latest ([#21](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/21)) ([2f8cf45](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/2f8cf453b1d9e2ed9b7ad04a79cf5b409cda9cd3))

## [1.5.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.4.3...v1.5.0) (2024-10-05)


### Features

* Update IAM policy for AWS Load Balancer Controller to support Listener Attributes ([#19](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/19)) ([ef9c1d7](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/ef9c1d76f49484a3c71cbd66ccd25b68078dc278))

## [1.4.3](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.4.2...v1.4.3) (2024-10-01)


### Bug Fixes

* Add required S3 PutObjectTagging permission to IAM policy ([#17](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/17)) ([def5c02](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/def5c02bf0c662d8a52cd4da1c671b3060231296))

## [1.4.2](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.4.1...v1.4.2) (2024-09-25)


### Bug Fixes

* Ensure FSX IAM Policy Permits Updating File Systems ([#16](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/16)) ([c9d93c3](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/c9d93c3ad016697d8b97e3d9c46f17e7b3e57b84))

## [1.4.1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.4.0...v1.4.1) (2024-09-05)


### Bug Fixes

* Change `association_defaults` type from `map(string)` to `any` to support tags ([#15](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/15)) ([85f2516](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/85f25165c7a115738d053ff93fa24b3d3701fb4b))

## [1.4.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.3.0...v1.4.0) (2024-08-07)


### Features

* Add cloudwatch logs policy to vpc-cni for networkpolicy logging ([#13](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/13)) ([a5da73e](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/a5da73e26a8d4ca46f76ea5e4e0c57479a451837))

## [1.3.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.2.1...v1.3.0) (2024-07-21)


### Features

* Add support for specifying assume role conditions ([#12](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/12)) ([5249afc](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/5249afcf2c5c8f7347c48d4bc8caab193dcf5e20))

## [1.2.1](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.2.0...v1.2.1) (2024-05-30)


### Bug Fixes

* TargetGroup Binding only policy requires policies for SecurityGroup ([#10](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/10)) ([ba34af4](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/ba34af404af6dd45a387dc8689e07183667afc58))

## [1.2.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.1.0...v1.2.0) (2024-04-02)


### Features

* Add fast snapshot restore policy to ebs csi role ([#5](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/5)) ([10f90d6](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/10f90d6d92e23b66520a92d9f80870d008825fdd))

## [1.1.0](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/compare/v1.0.0...v1.1.0) (2024-03-21)


### Features

* Add support for creating pod identity associations ([#4](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/issues/4)) ([98c5bdf](https://github.com/terraform-aws-modules/terraform-aws-eks-pod-identity/commit/98c5bdf103094e907315c980981841efae26ae2b))
