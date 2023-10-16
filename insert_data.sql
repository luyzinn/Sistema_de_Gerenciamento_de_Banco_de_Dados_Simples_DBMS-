INSERT INTO Livros (titulo, autor, ano_publicacao) VALUES 
('Dom Casmurro', 'Machado de Assis', 1899),
('A Revolução dos Bichos', 'George Orwell', 1945),
('Cem Anos de Solidão', 'Gabriel Garcia Marquez', 1967);

-- Inserção de dados na tabela Clientes com informações adicionais
INSERT INTO Clientes (nome, email, endereco, telefone, cidade, estado) VALUES 
('João Silva', 'joao@email.com', 'Rua A, 123', '1234567890', 'São Paulo', 'SP'),
('Maria Souza', 'maria@email.com', 'Avenida B, 456', '9876543210', 'Rio de Janeiro', 'RJ');

-- Inserção de dados na tabela Pedidos
INSERT INTO Pedidos (cliente_id, livro_id, data_pedido) VALUES
(1, 1, '2023-10-15'),
(2, 2, '2023-10-15');
