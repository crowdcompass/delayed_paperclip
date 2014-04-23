require 'woodhouse'

module DelayedPaperclip
  module Jobs
    class Woodhouse
      include ::Woodhouse::Worker

      def self.enqueue_delayed_paperclip(instance_klass, instance_id, attachment_name)
        async_process_file(
          instance_klass: instance_klass,
          instance_id: instance_id,
          attachment_name: attachment_name
        )
      end

      def process_file(options)
        DelayedPaperclip.process_job(
          options[:instance_klass],
          options[:instance_id],
          options[:attachment_name]
        )
      end
    end
  end
end
