function standError = stderror(data)

standError= std( data ) / sqrt( length( data ));
end