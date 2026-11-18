
module "eks" {

  # EKS module
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  # Cluster information
  name               = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true

  # VPC configuration
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Addons
  addons = {
    vpc-cni = {
      most_recent = true
      before_compute = true
    }

    kube-proxy = {
      most_recent = true
    }

    coredns = {
      most_recent = true
    }
  }

  # Control plane networking
  control_plane_subnet_ids = module.vpc.intra_subnets

  # Managed node groups
  eks_managed_node_groups = {
    first-eks-cluster-ng = {

      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m7i-flex.large"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "SPOT"
    }
  }

  # Tags
  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}
