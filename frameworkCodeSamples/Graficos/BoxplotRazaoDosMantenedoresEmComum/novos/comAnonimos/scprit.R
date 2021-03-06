library(effsize)
library(ggplot2)
library(forcats)

setwd("C:\\Users\\dudur\\Documents\\gabrielsmenezes\\ic\\frameworkCodeSamples\\Graficos\\BoxplotRazaoDosMantenedoresEmComum\\novos\\comAnonimos")

all=read.csv("comAnonimosComparandoPeloNomeEEmail.csv", sep=",",header=T)

p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$common.contributors/all$framework.contributors) * 100)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative number of frameworks \ncontributors in code samples and \nthe total of springboot contributors") + xlab("Code Samples") + ylab("") + 
  annotate("text", x = 2, y = 1, label = "1.4", size = 6) + annotate("text", x = 1, y = 0.02, label = "0", size = 6) +
  theme(plot.title=element_text(size=16,face="bold") ,axis.title=element_text(size=16),axis.text=element_text(size=16))

p1

ggsave("codeSampleInFramework.pdf", width = 4.5, height = 4.5)


p1 <- ggplot(all, aes(factor(all$framework,levels = c("Android","Spring")), (all$common.contributors/all$sample.contributors) * 100)) + 
  geom_violin(width=1, trim=TRUE, fill="#87CEFA") + 
  geom_boxplot(width=0.7,alpha=0.7) + ggtitle("Relative Framework\nContributors Inside\nCode Sample Project") + xlab("Code Samples") + ylab("Common Contributors") + 
  annotate("text", x = 2, y = 70, label = "75", size = 8) + annotate("text", x = 1, y = 5, label = "0", size = 8) + 
  theme(plot.title=element_text(size=20,face="bold") ,axis.title=element_text(size=18),axis.text=element_text(size=18))

p1

ggsave("FrameworkInCodeSample.pdf", width = 4.5, height = 4.5)
