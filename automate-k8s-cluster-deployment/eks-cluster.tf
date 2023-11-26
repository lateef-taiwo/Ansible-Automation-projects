provider "kubernetes" {
  #load_config_file = "false"
  host = data.aws_eks_cluster.myapp-cluster.endpoint
  token = data.aws_eks_cluster_auth.myapp-cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.myapp-cluster.certificate_authority.0.data)
}

data "aws_eks_cluster" "myapp-cluster" {
  name = module.eks.cluster_id 
}

data "aws_eks_cluster_auth" "myapp-cluster" {
  name = module.eks.cluster_id 
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  #version = "18.21.0"

  cluster_name = "eks-cluster"  
  #cluster_version = "1.22"

  subnet_ids = module.eks-vpc.private_subnets
  vpc_id = module.eks-vpc.vpc_id

  tags = {
    environment = "development"
    application = "eks"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.small"]
    }
  }
}


# Output the kubeconfig file
output "kubeconfig" {
  value = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_name          = module.eks.cluster_id
    cluster_endpoint      = data.aws_eks_cluster.myapp-cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.myapp-cluster.certificate_authority.0.data)
    token                 = data.aws_eks_cluster_auth.myapp-cluster.token
  })
  sensitive = true
}
