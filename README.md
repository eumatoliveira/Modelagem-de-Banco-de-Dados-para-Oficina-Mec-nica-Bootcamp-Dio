# Modelagem-de-Banco-de-Dados-para-Oficina-Mec-nica-Bootcamp-Dio

Este projeto tem como objetivo modelar um banco de dados para o sistema de controle e gerenciamento de ordens de serviço em uma oficina mecânica.

## Tabelas

*   **Cliente:** `id_cliente`, `nome_cliente`, `endereco_cliente`, `telefone_cliente`
*   **Veiculo:** `id_veiculo`, `id_cliente`, `placa_veiculo`, `modelo_veiculo`, `marca_veiculo`
*   **Mecanico:** `id_mecanico`, `codigo_mecanico`, `nome_mecanico`, `endereco_mecanico`, `especialidade_mecanico`
*   **Equipe:** `id_equipe`
*   **Equipe_Mecanico:** `id_equipe`, `id_mecanico`
*   **Ordem_Servico:** `id_os`, `id_veiculo`, `id_equipe`, `numero_os`, `data_emissao_os`, `data_conclusao_os`, `status_os`, `valor_total_os`
*   **Servico:** `id_servico`, `descricao_servico`, `valor_mao_de_obra`
*   **Peca:** `id_peca`, `nome_peca`, `valor_peca`
*   **OS_Servico:** `id_os`, `id_servico`
*   **OS_Peca:** `id_os`, `id_peca`, `quantidade_peca`

## Relacionamentos

*   Um cliente pode ter múltiplos veículos.
*   Um veículo pode ter múltiplas ordens de serviço.
*   Um mecânico pode fazer parte de uma equipe.
*   Uma equipe é designada para uma ordem de serviço.
*   Uma ordem de serviço pode ter múltiplos serviços.
*   Uma ordem de serviço pode ter múltiplas peças.

## Observações

*   A tabela `Equipe_Mecanico` é uma tabela de junção para representar o relacionamento N:N entre Equipe e Mecanico.
*   As tabelas `OS_Servico` e `OS_Peca` são tabelas de junção para representar os relacionamentos N:N entre Ordem_Servico e Servico, e Ordem_Servico