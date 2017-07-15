def destroy_message(message)
  modified_message = message
  if modified_message.include?(':')
    modified_message = modified_message[0..modified_message.index(':')]
  else
    modified_message = 'This has no alert.'
  end
  modified_message
end

def destroy_message!(message)
  modified_message = destroy_message(message)
  if not message.include?(':')
    'No alert here.'
  else
    message.replace(modified_message)
  end
end

# message = 'This message will self-destruct: You can\'t hug every cat.'

# puts destroy_message(message)
# puts message
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>'
# puts destroy_message!(message)
# puts message
# puts '>>>>>>>>>>>>>>>>>>>>>>>>>>'
